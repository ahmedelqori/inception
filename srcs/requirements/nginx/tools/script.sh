#!/bin/sh

mkdir -p /etc/ssl/private /etc/ssl/certs

openssl req -newkey rsa:2048 -x509 -sha256 -days 7 -nodes \
	-keyout /etc/ssl/private/ael-qori.42.fr.key \
	-out /etc/ssl/certs/ael-qori.42.fr.crt \
	-subj "/C=MA/ST=MarrakeshSafi/L=BG/O=42/OU=1337BG/CN=ael-qori"

ln -s /etc/nginx/sites-available/ael-qori.42.fr.conf /etc/nginx/sites-enabled/

exec "$@"