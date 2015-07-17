#!/usr/bin/env sh
mkdir -p /shared
chown root:root -R /shared
mkdir -p /shared/.synctmp
exec rsync --daemon --no-detach
