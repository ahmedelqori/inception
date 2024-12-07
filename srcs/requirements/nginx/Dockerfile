FROM alpine:latest

RUN apk update && apk upgrade && apk add nginx

COPY ./tools/script.sh /src/script.sh

WORKDIR /src

RUN chmod +x script.sh
RUN sh script.sh

# ENTRYPOINT [ "sh ./script.sh" ]