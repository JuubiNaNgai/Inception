#!/bin/bash

cd /var/www/html


rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /wp-config.php /var/www/html/wp-config.php


sed -i -r "s/db1/$SQL_DATABASE/1"   wp-config.php
sed -i -r "s/user/$SQL_USER/1"  wp-config.php
sed -i -r "s/pwd/$SQL_PASSWORD/1"    wp-config.php

wp core install --url=$URL/ --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_MAIL --skip-email --allow-root


wp user create $USER $USER_MAIL --role=author --user_pass=$USER_PASSWORD --allow-root

mkdir /var/run/php

/usr/sbin/php-fpm7.4 -F
