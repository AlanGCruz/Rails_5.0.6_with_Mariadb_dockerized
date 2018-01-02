FROM ruby:2.4.2-slim

RUN apt-get update -y \
    && apt-get install -y \
      git \
      make \
      gcc+ \
      libmysqlclient-dev \
      mariadb-client \
    && apt-get clean

RUN gem install bundler --version "1.16" \
    && gem cleanup

RUN apt-get update  -y \
    && apt-get install -y \
    nodejs \
    && apt-get clean

RUN chmod 777 -R "$GEM_HOME"

RUN useradd -m -u 1000 user
USER user

WORKDIR /app

