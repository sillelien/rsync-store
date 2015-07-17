#!/usr/bin/with-contenv sh
mkdir -p /shared
export RSYNC_PASSWORD=secret
set -e
if [ -f /tmp/.running ]
then
    echo "Already running!!!"
    exit 0
fi

touch /tmp/.running
trap "rm /tmp/.running ; sleep 1 " EXIT

server=${SERVER_PORT_873_TCP_ADDR}
server_port=${SERVER_PORT_873_TCP_PORT}


mkdir -p /.synctmp

rsync --port=${server_port} -r --quiet --delete-after --temp-dir=/.synctmp  --backup --backup-dir=${local_dir}/.syncbackrev  --exclude ".sync*" root@${server}::share /shared/
inotifywait -e modify -e create -e move -e delete -e attrib -e close_write -t 3600 -r /shared/
touch ${local_dir}/.synclast
rsync --port=$server_port -r --quiet --delete-after --temp-dir=/.synctmp  --timeout=60 --backup --backup-dir=${local_dir}/.syncbackup  --exclude ".sync*"   /shared/  root@${server}::share
