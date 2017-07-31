#!/usr/bin/env bash

echo "----- Provision: Setting up cron ..."
# Overwrite crontab configuration
crontab /vagrant/vagrant/cron/crontab
