#!/usr/bin/with-contenv sh
set -x
find /shared/.syncbackup -mtime +${BACKUP_DAYS:-7} -exec rm {} \;
sleep 86400
