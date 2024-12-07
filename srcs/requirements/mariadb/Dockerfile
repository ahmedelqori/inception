FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add --no-cache mariadb \
    mariadb-client wget mysql mysql-client php82-mysqli


COPY tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh

RUN mkdir -p /var/lib/mysql /run/openrc && \
chown -R mysql:mysql /var/lib/mysql

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

RUN echo '#!/bin/sh' > /entrypoint.sh && \
echo 'mkdir -p /run/openrc' >> /entrypoint.sh && \
echo 'touch /run/openrc/softlevel' >> /entrypoint.sh && \
echo '/home/script.sh &' >> /entrypoint.sh && \
echo 'mariadbd-safe --datadir=/var/lib/mysql' >> /entrypoint.sh && \
chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]