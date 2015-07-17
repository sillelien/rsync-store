#!/usr/bin/env sh
set -ex
apk -Uuv add rsync
cat <<EOF >/etc/rsyncd.conf
motd file = /etc/rsyncd.motd

[share]
path = /shared/
comment = Shared storage
uid = root
gid = root
read only = no
auth users = root
list = yes
secrets file = /etc/rsyncd.scrt
EOF

echo -n "root:secret" > /etc/rsyncd.scrt

chown root:root /etc/rsyncd.scrt

chmod 600 /etc/rsyncd.scrt