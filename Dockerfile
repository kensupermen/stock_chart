FROM ruby:2.4.1-alpine3.6

RUN apk add --update build-base libffi-dev libxml2-dev libxslt-dev postgresql-dev nodejs tzdata bash

ENV RAILS_ENV=development \
    APP_HOME=/masterclass

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile
RUN touch $APP_HOME/Gemfile.lock
ADD . $APP_HOME

RUN gem install bundler
RUN bundle install -j 20
