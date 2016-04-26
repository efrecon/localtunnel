FROM mhart/alpine-node
MAINTAINER Emmanuel Frecon <efrecon@gmail.com>

RUN npm install -g localtunnel

ENTRYPOINT ["node", "/usr/bin/lt"]
