#!/usr/bin/env sh
find /shared/.syncbackup -mtime +7 -exec rm {} \;
sleep 86400
