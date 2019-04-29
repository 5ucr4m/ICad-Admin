module Rack
  class Attack

    Rack::Attack.blocklisted_response = lambda do |_env|
      # Using 503 because it may make attacker think that they have successfully
      # DOSed the site. Rack::Attack returns 403 for blocklists by default
      [503, {}, ['Blocked']]
    end

    Rack::Attack.throttled_response = lambda do |_env|
      # NB: you have access to the name and other data about the matched throttle
      #  env['rack.attack.matched'],
      #  env['rack.attack.match_type'],
      #  env['rack.attack.match_data']

      # Using 503 because it may make attacker think that they have successfully
      # DOSed the site. Rack::Attack returns 429 for throttling by default
      [503, {}, ["Server Error\n"]]
    end

    # Track requests from a special user agent.
    # Supports optional limit and period, triggers the notification only when
    # the limit is reached.
    Rack::Attack.track('special_agent', limit: 6, period: 60.seconds) do |req|
      req.user_agent == 'SpecialAgent'
    end

    ### Configure Cache ###

    # If you don't want to use Rails.cache (Rack::Attack's default), then
    # configure it here.
    #
    # Note: The store is only used for throttling (not blacklisting and
    # whitelisting). It must implement .increment and .write like
    # ActiveSupport::Cache::Store

    # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

    ### Throttle Spammy Clients ###

    # If any single client IP is making tons of requests, then they're
    # probably malicious or a poorly-configured scraper. Either way, they
    # don't deserve to hog all of the app server's CPU. Cut them off!
    #
    # Note: If you're serving assets through rack, those requests may be
    # counted by rack-attack and this throttle may be activated too
    # quickly. If so, enable the condition to exclude them from tracking.

    # Throttle all requests by IP (60rpm)
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
    throttle('req/ip', limit: 300, period: 5.minutes, &:ip)

    ### Prevent Brute-Force Login Attacks ###

    # The most common brute-force login attack is a brute-force password
    # attack where an attacker simply tries a large number of emails and
    # passwords to see if any credentials match.
    #
    # Another common method of attack is to use a swarm of computers with
    # different IPs to try brute-forcing a password for a specific account.

    # Throttle POST requests to /login by IP address
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
    throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
      req.ip if req.path == '/auth/login' && req.post?
    end

    # Throttle POST requests to /login by email param
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/email:#{req.email}"
    #
    # Note: This creates a problem where a malicious user could intentionally
    # throttle logins for another user and force their login requests to be
    # denied, but that's not very common and shouldn't happen to you. (Knock
    # on wood!)
    throttle('logins/email', limit: 5, period: 20.seconds) do |req|
      if req.path == '/auth/login' && req.post?
        # return the email if present, nil otherwise
        req.params['email'].presence
      end
    end

    ### Custom Throttle Response ###

    # By default, Rack::Attack returns an HTTP 429 for throttled responses,
    # which is just fine.
    #
    # If you want to return 503 so that the attacker might be fooled into
    # believing that they've successfully broken your app (or you just want to
    # customize the response), then uncomment these lines.
    # self.throttled_response = lambda do |env|
    #  [ 503,  # status
    #    {},   # headers
    #    ['']] # body
    # end

  end
end
