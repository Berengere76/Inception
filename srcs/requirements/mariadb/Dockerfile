FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY conf/script.sh etc/mysql/script.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "etc/mysql/script.sh"]

CMD [ "mysqld --bind-address=0.0.0.0" ] 

#  mysqld :  le programme qui exécute la base de données et gère toutes les requêtes SQL
# --bind-address= :  MariaDB acceptera les connexions sur toutes les interfaces réseau disponibles