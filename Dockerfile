FROM ubuntu
MAINTAINER Emmanuel Frecon <efrecon@gmail.com>

RUN apt-get update && \
  apt-get install -y npm && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN npm install -g localtunnel

ENTRYPOINT ["nodejs", "/usr/local/bin/lt"]
