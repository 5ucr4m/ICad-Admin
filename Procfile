web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml
schedule: clockwork clock.rb
release: bundle exec rake db:migrate && bundle exec rake seed:migrate

