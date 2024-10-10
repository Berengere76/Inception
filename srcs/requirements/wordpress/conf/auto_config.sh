#!/bin/bash
echo "Starting auto_config.sh"
echo "Current directory: $(pwd)"
echo "Environment variables: $(env)"

sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	echo "Configuring WordPress..."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

	wp config create --allow-root                       \
					 --dbname=$DB_NAME                  \
					 --dbuser=$DB_USER                  \
					 --dbpass=$DB_PASSWORD              \
					 --dbhost=$DB_HOST                  \
					 --path='/var/www/wordpress'

	wp core install --url=$WP_URL                       \
					--title=$WP_TITLE                   \
					--admin_user=$WP_ADMIN              \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL       \
					--skip-email						\
					--allow-root

	wp user create $WP_USER $WP_USER_EMAIL              \
				   --role=author                        \
				   --user_pass=$WP_USER_PASSWORD        \
				   --allow-root

	wp option update home 'https://blebas.42.fr' --allow-root
	wp option update siteurl 'https://blebas.42.fr' --allow-root
else
	echo "Wordpress déjà configuré"
fi

exec "$@"