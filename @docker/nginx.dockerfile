FROM nginx:alpine

RUN	mkdir /build
RUN chown -R nginx:nginx /build