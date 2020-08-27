FROM ruby:2.7.1-alpine3.11

LABEL maintainer="caue.guedes91@gmail.com"

RUN apk update && apk add --no-cache bash \
    build-base \
    nodejs \
    yarn \
    postgresql-dev \
    netcat-openbsd \
    tzdata


WORKDIR /usr/src/app

