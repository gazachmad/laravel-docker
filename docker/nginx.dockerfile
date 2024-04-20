FROM nginx:alpine-slim

COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf