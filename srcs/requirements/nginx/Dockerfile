FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

EXPOSE 443