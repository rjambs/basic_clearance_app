FROM ruby:2.3.4-slim-jessie 

RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list

RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y --no-install-recommends \
    build-essential vim libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp & mkdir -p /myapp/shared/pids /myapp/shared/sockets /myapp/shared/logs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN echo $BUNDLER_VERSION && bundle install
COPY . /myapp