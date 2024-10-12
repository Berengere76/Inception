#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --skip-networking &
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

cat << EOF > init.sql
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysql -u root -p${DB_ROOT_PASSWORD} < init.sql
rm -f init.sql

mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

exec mysqld --bind-address=0.0.0.0


# COMMANDES POUR LA DATABASE

# Pour se connecter avec les deux user ===> sudo docker exec -it mariadb mysql OU sudo docker exec -it mariadb mysql -u blebas -p123

# Pour montrer les tables ===> show databases; use inception_db; show tables;

# Pour montrer les users ===> select current_user(); select * from wp_users; select user_login from wp_users;
