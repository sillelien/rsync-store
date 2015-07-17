#!/usr/bin/with-contenv sh
mkdir -p /shared
export RSYNC_PASSWORD=secret
/bin/sync.sh