FROM docker:1.12-dind

RUN apk update && \
    apk add bash curl git nano subversion vim wget

COPY dockerd-entrypoint.sh /usr/local/bin/
