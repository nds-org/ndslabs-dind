#!/bin/sh
set -e

if [ "$#" -eq 0 -o "${1:0:1}" = '-' ]; then
    set -- docker daemon \
        --host=unix:///var/run/docker.sock \
        --host=tcp://0.0.0.0:2375 \
        --registry-mirror=http://docker-cache.default:5001 \
        --mtu=1404 \
        --storage-driver=overlay \
        "$@"
fi

if [ "$1" = 'docker' -a "$2" = 'daemon' ]; then
    # if we're running Docker, let's pipe through dind
    # (and we'll run dind explicitly with "sh" since its shebang is /bin/bash)
    set -- sh "$(which dind)" "$@"
fi


#exec "$@"
nohup "$@" </dev/null >dind.log 2>&1 &

adduser -h /home/$NAMESPACE -s /bin/bash -G root -D -H $NAMESPACE
mkdir -p /home/$NAMESPACE

cd /wetty
sed -i "106s?^.*?term = pty.spawn('/bin/su', ['-', '$NAMESPACE'], {?" app.js
node app.js -p 3000
