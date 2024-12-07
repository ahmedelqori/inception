FROM alpine:3.16

RUN apk update && apk upgrade
RUN apk add openrc
RUN apk add --no-cache \
    bash \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-curl \
    php81-gd \
    php81-mbstring \
    php81-xml \
    php81-zip \
    php81-tokenizer \
    php81-pecl-imagick \
    wget \
    tar \
    && rm -rf /var/cache/apk/*

RUN openrc
RUN touch /run/openrc/softlevel

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

COPY tools/script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]