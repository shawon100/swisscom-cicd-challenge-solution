FROM alpine:latest

RUN apk update && apk add --no-cache \
    curl \
    jq

WORKDIR /app

COPY first-script.sh .

CMD [ "sh", "first-script.sh" ]
