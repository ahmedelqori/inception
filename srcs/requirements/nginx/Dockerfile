FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

COPY conf/nginx.conf /etc/nginx/http.d/default.conf
COPY html/index.html /var/www/ael-qori.42.fr/index.html
COPY tools/script.sh /home/script.sh

RUN openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
    -keyout /etc/ssl/private/ael-qori.42.fr.key \
    -out /etc/ssl/certs/ael-qori.42.fr.crt \
    -subj "/C=MA/ST=Marrakesh Safi/L=Ben Guerir/OU=1337/O=42/CN=ael-qori.42.fr"

RUN chmod +x /home/script.sh

EXPOSE 443 80

ENTRYPOINT ["sh", "/home/script.sh"]
