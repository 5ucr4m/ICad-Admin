FROM pawurb/ruby-jemalloc-node-yarn:latest

RUN apt-get -y install libxslt-dev libxml2-dev

COPY Gemfile* /tmp/
COPY package.json /tmp/
COPY yarn.lock /tmp/

WORKDIR /tmp

RUN bundle install --jobs 5 --retry 5
RUN yarn install
RUN mkdir /app

WORKDIR /app

COPY . /app

ENV RAILS_ENV production
ENV APP_NAME ICADX
ENV LOG_LEVEL debug
ENV RAILS_MASTER_KEY 805788800162fe396f8b966b146d16e0
ENV WORKER_TIMEOUT 3600
ENV RAILS_MAX_THREADS 5
ENV WEB_CONCURRENCY 2
ENV DB_NAME icadx
ENV DB_REAPING_FREQUENCY 10
ENV SIDEKIQ_USERNAME root
ENV SIDEKIQ_PASSWORD 4dmin112@@@

CMD ["bin/run-dev.sh"]
