#!/usr/bin/env bash

echo "----- Provision: Moving to '/vagrant' directory ..."
cd "/vagrant"

echo "----- Provision: Installing composer dependencies ..."
composer install --no-interaction

# Available unprivileged configurations
bash /vagrant/vagrant/cron/cron.sh
