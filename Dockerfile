FROM ruby:2.4.1-alpine3.6

RUN apk add --update build-base libffi-dev libxml2-dev libxslt-dev postgresql-dev nodejs tzdata bash
RUN gem install bundler

ENV RAILS_ENV=development \
    APP_HOME=/stock_chart_app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install -j 20

ADD . $APP_HOME

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
