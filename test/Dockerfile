FROM alpine:latest

RUN apk update && apk upgrade

COPY src /src

WORKDIR /src

RUN apk add nodejs && apk add npm && npm i

EXPOSE 5000


ENTRYPOINT [ "npm", "run", "dev" ]