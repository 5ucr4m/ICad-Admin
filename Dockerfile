FROM pawurb/ruby-jemalloc-node-yarn:latest

COPY Gemfile* /tmp/
COPY package.json /tmp/
COPY yarn.lock /tmp/

WORKDIR /tmp

RUN bundle install --jobs 5 --retry 5 --without development test
RUN yarn install
RUN mkdir /app

WORKDIR /app

COPY . /app

ENV RAILS_ENV production
ENV APP_NAME ICADX
ENV LOG_LEVEL debug
ENV WORKER_TIMEOUT 3600
ENV RAILS_MAX_THREADS 5
ENV WEB_CONCURRENCY 2
ENV DB_NAME icadx
ENV DB_REAPING_FREQUENCY 10
ENV SIDEKIQ_USERNAME root
ENV SIDEKIQ_PASSWORD 4dmin112@@@

CMD ["bin/run-dev.sh"]
