FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sql usr/local/bin