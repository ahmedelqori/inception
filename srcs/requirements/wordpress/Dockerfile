FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc lighttpd php82 \
    fcgi php82-cgi wget mysql mysql-client php82-mysqli
RUN openrc &&\
    mkdir -p /run/openrc && \
    touch /run/openrc/softlevel
COPY tools/script.sh /home/script.sh
RUN  chmod +x /home/script.sh

EXPOSE 9000

CMD [ "/home/script.sh" ]