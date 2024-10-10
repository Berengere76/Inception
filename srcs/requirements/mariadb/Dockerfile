FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY conf/script.sh etc/mysql/script.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "etc/mysql/script.sh"]

CMD [ "mysqld --bind-address=0.0.0.0" ]

# RUN mkdir /run/mysqld && chown mysql:mysql /run/mysqld

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# COPY conf/init.sql /etc/mysql/init.sql

# RUN chmod 777 /etc/mysql/init.sql

# CMD ["mysqld"]