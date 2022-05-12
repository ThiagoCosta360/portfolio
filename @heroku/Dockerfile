FROM nginx:alpine

# install node and npm
RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/main libuv \
	&& apk add --no-cache --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main nodejs=16.14.2-r0 \
	&& echo "NodeJS Version:" "$(node -v)"

# set work directory
ENV APP_ROOT /home/app
WORKDIR $APP_ROOT
# set nginx port
ENV PORT 80
ENV MODE prod
# this is needed to allow self signed certificates
ENV NODE_TLS_REJECT_UNAUTHORIZED 0

# Context from portfolio folder
# copy nginx config
COPY @heroku/template.conf /etc/nginx/conf.d/default.conf.template
# COPY @heroku/nginx.conf /etc/nginx/nginx.conf
# copy docker entrypoint
COPY @heroku/docker-entrypoint.sh $APP_ROOT/
# copy front build version
COPY dist/front /usr/share/nginx/html
# copy back build version
COPY dist/back $APP_ROOT/


RUN ["chmod", "+x", "./docker-entrypoint.sh"]
CMD ["/bin/sh","-c", "./docker-entrypoint.sh"]