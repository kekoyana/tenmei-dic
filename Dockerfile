FROM ruby:2.7.1-alpine

ENV LANG=C.UTF-8 \
    BUNDLER_VERSION=2.1.4 \
    BUNDLE_JOBS=4 \
    BUNDLE_PATH=/usr/local/bundle \
    PATH=$PATH:/work/bin

RUN apk add --update --no-cache \
    bash \
    build-base \
    nodejs \
    yarn \
    postgresql-dev \
    postgresql \
    git \
    less \
    curl \
    vim \
    wget \
    chromium \
    chromium-chromedriver && \
    gem install bundler -v ${BUNDLER_VERSION} && \
    gem update --system

ENV APP_PATH /work
WORKDIR $APP_PATH

CMD ["/work/run_server.sh"]
