# Packfire Framework VM Development Box
using _Vagrant_ and _Puppet_.

The development environment for Packfire Framework for PHP contains 2x Vagrant boxes:

###Web Server
 - Ubuntu 12.04 TLS Precise 64 (provided by Vagrant)
 - Provisioning: [Puppet](http://puppetlabs.com)
 - Tools: curl, vim, git
 - Apache HTTP Server: apache2, mod_rewrite
 - PHP 5: php5, php5-cli, php5-mysql, php-pear, php5-dev, php5-gd, libapache2-mod-php5
 - [Composer](https://getcomposer.org/)

###Database Server
 - Ubuntu 12.04 TLS Precise 64 (provided by Vagrant)
 - Provisioning: [Puppet](http://puppetlabs.com)
 - Tools: curl, vim, git
 - MySQL 5.5 Server and Client

As I reside in Singapore, I've set my VM environment (in `Vagrantfile`) to use the same timezone as my host computer. You can modify this line of code in the Vagrantfile easily (or totally remove it).

If `vagrant.sh` is placed in the same folder, it will be executed in the provisioning of the Web Server.

Feel free to fork and make it your own development box.