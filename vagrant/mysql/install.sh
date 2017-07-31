#!/usr/bin/env bash

echo "----- Provision: Installing mysql ..."
# Username: root
# Password: root
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

apt-get install -y \
        mysql-server
