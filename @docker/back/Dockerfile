FROM alpine:latest

RUN apk add nodejs
RUN apk add --update nodejs npm
RUN chown 1000:1000 "/root"

CMD ["npm", "run", "start"]