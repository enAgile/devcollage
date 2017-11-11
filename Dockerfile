FROM ruby:2.3.4
ENV LANG C.UTF-8

# Install Packages
RUN apt-get update -qq && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      npm \
      nodejs-legacy \
      graphviz \
      imagemagick \
      sqlite3

RUN npm install -g phantomjs
RUN gem install bundler -v 1.15.0

# Application
ENV app_name devcollege
ENV app_home_path /$app_name

RUN mkdir $app_home_path
WORKDIR $app_home_path

ADD Gemfile* $app_home_path/

ENV BUNDLE_GEMFILE=$app_home_path/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

ADD . $app_home_path
