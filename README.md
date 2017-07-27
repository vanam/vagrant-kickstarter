# Vagrant Kickstarter

Start your Vagrant project in no time.

## Available configurations

* Apache
* PHP (PHP 7.1 + composer)
* MySQL

## Usage

1) Clone this repository
2) Install Vagrant
3) Install plugins
  * (Recommended) `vagrant plugin install vagrant-hostmanager`
    * Automatically fills `/etc/hosts`
    * It **prompts** a user **for a password**. For **passwordless** sudo follow [Passwordless sudo](https://github.com/devopsgroup-io/vagrant-hostmanager#passwordless-sudo) instructions
4) Edit `config.vm.hostname`
5) Select configuration in main provisioning file `install.sh`
6) (Optional) Fine tune configuration files

## Roadmap

My goal here is to create **simplistic** and **modular** Vagrant project demo where unwanted functionality can be easily gotten rid off.

### Configurations

* Cron
* Jekyll
* Cron
* NodeJS
* Wordpress
* MariaDB
* MongoDB
* Redis
* ...

### Provisioning

* Use configuration management system such as [Ansible](https://www.vagrantup.com/docs/provisioning/ansible.html) instead of shell scripts

## Contribution

Feel free to use, modify, and extend the code. Bug fixes and improvements are welcomed. However, I am sceptical about accepting pull requests containing new functionality because I don't want to build an almighty Goliath. Nevertheless, who knows ;-)

## Credits

Based on awesome [video](https://www.youtube.com/watch?v=crvJ2C7Hr_g) by [Brad Westfall](https://github.com/bradwestfall) and his [source code](https://github.com/bradwestfall/vagrant-kickstarter).
