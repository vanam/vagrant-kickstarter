#!/usr/bin/env bash

echo "----- Provision: Installing php ..."
apt-get install -y \
        php7.1 \
        php7.1-xdebug \
        php7.1-zip \
        php7.1-mysql \
        libapache2-mod-php7.1

echo "----- Provision: Installing composer ..."
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
  >&2 echo 'ERROR: Invalid installer signature'
else
  php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
fi

rm composer-setup.php
