FROM ruby:2.7.3

RUN apt-get update -qq

ENV APP_HOME /app
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install --jobs=4

ADD . $APP_HOME

EXPOSE 3001
