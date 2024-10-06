FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

# Crée le certificat SSL, type de certificat x509, -nodes pour éviter de taper un mdp, /etc -keyout /etc pour dire où on stocke le certif et la clé, et -subj pour remplir les attributs
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/S=Normandie/L=Le Havre/O=42/OU=blebas/CN=blebas"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# Donne les permissions à root et à l'utilisateur
RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]