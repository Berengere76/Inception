FROM debian:bullseye

# Installation des paquets nécessaires
RUN apt update && apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

# Installation de Wordpress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Configuration de Wordpress
COPY conf/auto_config.sh /var/www/wordpress/auto_config.sh
RUN chown -R root:root /var/www/wordpress
RUN chmod 777 /var/www/wordpress/auto_config.sh

# Configuration de PHP, remplace la ligne pour écouter sur le port 9000, -i pour modif direct le ficher
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

# Installation de WP-CLI, outil en ligne de commande pour Wordpress, pour utiliser les commandes WP
# +x pour rendre le fichier exécutable
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php

# Configuration de l'entrée de la commande
WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT [ "sh", "/var/www/wordpress/auto_config.sh" ]

# Démarrage de PHP en mode foreground, pour éviter qu'il ne se ferme
CMD [ "/usr/sbin/php-fpm7.4", "-F" ]