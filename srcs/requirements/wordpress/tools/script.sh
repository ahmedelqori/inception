#!/bin/bash
set -e

WP_DOMAIN=${DOMAIN:-localhost}
WP_DATABASE_NAME=${MYSQL_DATABASE:-wordpress}
WP_DATABASE_USER=${MYSQL_USER:-wordpress}
WP_DATABASE_PASSWORD=${MYSQL_PASSWORD:-wordpress_password}
WP_DATABASE_HOST=${WP_DATABASE_HOST:-mariadb}


if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Downloading WordPress..."
    wget https://wordpress.org/latest.tar.gz
    tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1
    rm latest.tar.gz

    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    sed -i "s/database_name_here/$WP_DATABASE_NAME/" /var/www/html/wp-config.php
    sed -i "s/username_here/$WP_DATABASE_USER/" /var/www/html/wp-config.php
    sed -i "s/password_here/$WP_DATABASE_PASSWORD/" /var/www/html/wp-config.php
    sed -i "s/localhost/$WP_DATABASE_HOST/" /var/www/html/wp-config.php

    echo "define('WP_HOME', 'https://$WP_DOMAIN');" >> /var/www/html/wp-config.php
    echo "define('WP_SITEURL', 'https://$WP_DOMAIN');" >> /var/www/html/wp-config.php

    chown -R nobody:nobody /var/www/html
fi

php-fpm81 -F