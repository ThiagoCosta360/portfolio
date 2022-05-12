envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
node main.js 2>&1 &
nginx -g 'daemon off;'