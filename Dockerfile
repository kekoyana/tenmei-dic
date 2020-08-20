FROM ruby:2.7.1-slim-buster

ENV LANG=C.UTF-8 \
    BUNDLER_VERSION=2.1.4 \
    BUNDLE_JOBS=4 \
    BUNDLE_PATH=/usr/local/bundle \
    PATH=$PATH:/work/bin

RUN apt-get update -qq && apt-get install -y gnupg2 curl

ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    nodejs \
    yarn \
    build-essential \
    postgresql-client \
    libpq-dev \
    vim \
    wget && \
    gem install bundler -v ${BUNDLER_VERSION} && \
    gem update --system && \
    apt-get -y clean

ENV APP_PATH /work
WORKDIR $APP_PATH

CMD ["/work/run_server.sh"]
