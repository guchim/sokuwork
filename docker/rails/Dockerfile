# Dockerfile
# (Rails/MySQL)

FROM  ruby:2.6.3-alpine

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LC_CTYPE="utf-8"

ENV APP="/sokuwork" \
    CONTAINER_ROOT="./" \
    MYSQL_PORT=3306 \
    SERVER_PORT=3000

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
        alpine-sdk \
            build-base \
        bash \
        imagemagick \
        jq \
        less \
        libgcrypt-dev \
        libxml2-dev \
            libxslt-dev \
        mariadb-dev \
        mysql-client \
        nodejs \
        redis \
        tzdata \
        wget \
            xvfb \
        yaml-dev \
            yarn \
            zlib-dev \
 && gem install -q -N bundler \
 && gem install -q -N pkg-config \
 && gem install -q -N rails -v 5.2.3 \
 && gem install -q -N mysql2 -v 0.4.4 \
 && gem install -q -N devise -v 4.6.2

WORKDIR $APP
COPY Gemfile Gemfile.lock $CONTAINER_ROOT
RUN bundle install --jobs=4 --retry=3

ENV RAILS_SERVE_STATIC_FILES=true \
    PORT=$SERVER_PORT \
    TERM=xterm
EXPOSE $SERVER_PORT
EXPOSE $MYSQL_PORT
RUN mkdir -p tmp/sockets
