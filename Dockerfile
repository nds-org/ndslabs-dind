FROM docker:1.12-dind

RUN apk update && \
    apk add alpine-sdk bash curl git nano nodejs python subversion vim wget && \
    cd / && git clone https://github.com/krishnasrinivas/wetty.git && \
    cd wetty && npm install 


EXPOSE 3000

COPY dockerd-entrypoint.sh /usr/local/bin/
