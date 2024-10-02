FROM debian:bullseye

RUN apt-get update && upgrade && apt install -y nginx

CMD ["nginx", "-g", "daemon off;"]