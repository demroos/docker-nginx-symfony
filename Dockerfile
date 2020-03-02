FROM nginx:alpine

ENV FPM_HOST=php-fpm

COPY ./default.conf /etc/nginx/conf.d/default.conf.template
EXPOSE 80
EXPOSE 443
CMD /bin/sh -c "envsubst '\$FPM_HOST' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
