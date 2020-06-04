# use ruby version 2.6
FROM ruby:2.6.3

# using japanese on rails console
ENV APP="/sokuwork" \
    CONTAINER_ROOT="./" \
    MYSQL_PORT=3306 \
    SERVER_PORT=3000 \
    DEBCONF_NOWARNINGS=yes \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=yes \
    XDG_CACHE_HOME="/tmp" \
    RAILS_SERVE_STATIC_FILES=true \
    PORT=$SERVER_PORT \
    TERM=xterm \
    LANG="C.UTF-8"

EXPOSE $SERVER_PORT
EXPOSE $MYSQL_PORT

# setting work directory
RUN mkdir /sokuwork
WORKDIR /sokuwork
RUN mkdir -p tmp/sockets

# install package to docker container
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    vim \
    less \
    jq

# install yarn
RUN apt-get install apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# executing bundle install
COPY Gemfile /sokuwork/Gemfile
