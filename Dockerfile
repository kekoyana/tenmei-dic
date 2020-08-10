FROM ruby:2.7.1-slim-buster

ENV LANG=C.UTF-8 \
    BUNDLER_VERSION=2.1.4 \
    BUNDLE_JOBS=4 \
    BUNDLE_PATH=/usr/local/bundle \
    PATH=$PATH:/work/bin

RUN apt update
RUN apt install -y \
    bash \
    build-essential \
    nodejs \
    yarn \
    libpq-dev \
    git \
    less \
    curl \
    vim \
    wget \
    chromium && \
    gem install bundler -v ${BUNDLER_VERSION} && \
    gem update --system

ENV APP_PATH /work
WORKDIR $APP_PATH

CMD ["/work/run_server.sh"]
