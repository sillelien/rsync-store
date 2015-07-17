FROM vizzbuzz/base-alpine

VOLUME /shared

COPY build.sh /tmp/build.sh
RUN chmod 755 /tmp/build.sh
RUN /tmp/build.sh

COPY update.sh /etc/services.d/update/run
COPY sync.sh /bin/sync.sh
RUN chmod 755 /etc/services.d/update/run /bin/sync.sh
