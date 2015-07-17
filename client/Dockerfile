FROM vizzbuzz/base-alpine

VOLUME /shared

COPY build.sh /tmp/build.sh
RUN chmod 755 /tmp/build.sh
RUN /tmp/build.sh

COPY update.sh /etc/services.d/update/run
RUN chmod 755 /etc/services.d/update/run
