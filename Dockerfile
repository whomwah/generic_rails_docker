FROM ubuntu:16.04
MAINTAINER duncan@kyan.com
ENV REFRESHED_AT 2016-07-27

# Setup specifc Envs
ENV RUBY_CONFIGURE_OPTS --disable-install-doc

# Locales
RUN locale-gen en_GB.UTF-8 \
  && dpkg-reconfigure -f noninteractive locales

# Install Wget
RUN apt-get update && apt-get -y install wget \
  build-essential \
  libpq-dev \
  nodejs \
  git

# Install Ruby-Install
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz \
  && tar -xzvf ruby-install-0.6.0.tar.gz \
  && cd ruby-install-0.6.0/ \
  && make install

# Install Ruby
RUN ruby-install --system ruby 2.3

# Install RubyGems
RUN gem update --system --no-rdoc --no-ri

# Install Bundler
RUN gem install bundler --no-rdoc --no-ri

# App
RUN mkdir -p /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
