FROM ubuntu:18.04
LABEL \
    maintainer="Nathan@Genetzky.us"

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    curl \
    git \
    make \
    man \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY \
  'share/po-common' \
  'share/po-linux' \
  'share/po-docker' \
  '/usr/local/share/'

COPY \
  'bin/po' \
  '/usr/local/bin/po'

RUN chmod 755 '/usr/local/bin/po' \
  && po config release/v0.6.3 duo false \
  && po install "${HOME}/.po-util/src" basic

# ENTRYPOINT '/usr/local/bin/po'
