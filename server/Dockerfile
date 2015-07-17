FROM vizzbuzz/base-alpine

VOLUME /shared
EXPOSE 873

COPY build.sh /tmp/build.sh
RUN chmod 755 /tmp/build.sh
RUN /tmp/build.sh

#COPY ssh.sh /etc/services.d/sshd/run
#RUN chmod 755 /etc/services.d/sshd/run
COPY rsync.sh /etc/services.d/rsync/run
RUN chmod 755 /etc/services.d/rsync/run
