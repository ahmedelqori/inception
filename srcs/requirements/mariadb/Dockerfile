# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ael-qori <ael-qori@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/14 03:54:40 by ael-qori          #+#    #+#              #
#    Updated: 2025/01/14 23:05:52 by ael-qori         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.21.2

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

COPY /tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]

CMD ["mariadbd-safe"]