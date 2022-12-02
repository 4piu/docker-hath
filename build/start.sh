#!/bin/sh

kill_jar() {
  echo 'Received TERM'
  pkill java
  wait "$(ps -ef | pgrep java)"
  echo 'Process finished'
}

if [ $CLIENT_ID ] && [ $CLIENT_KEY ]; then
    mkdir -p /hath/data/
    echo -n "${CLIENT_ID}-${CLIENT_KEY}" > /hath/data/client_login
else if [ ! -f /hath/data/client_login ]; then
    echo "Please specify the CLIENT_ID and CLIENT_KEY, exiting..."
    exit 1
    fi
fi

trap 'kill_jar' TERM INT KILL
java -jar HentaiAtHome.jar --cache-dir=/hath/cache --data-dir=/hath/data --download-dir=/hath/download --log-dir=/hath/log --temp-dir=/hath/temp &

wait $!
