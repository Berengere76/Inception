sleep 10

if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "Configuring WordPress..."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

	wp config create --allow-root                       \
					 --dbname=$DB_NAME                  \
					 --dbuser=$DB_USER                  \
					 --dbpass=$DB_PASSWORD              \
					 --dbhost=$DB_HOST                  \
					 --path='/var/www/html'

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

fi

exec "$@"