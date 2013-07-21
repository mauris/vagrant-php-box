# PHP VM Development Box
using _Vagrant_ and _Puppet_.

The development environment contains the following:

 - Ubuntu 12.04 TLS Precise 64 (provided by Vagrant)
 - Provisioning: [Puppet](http://puppetlabs.com)
 - Packages: curl, vim, git
 - Apache HTTP Server: apache2, mod_rewrite
 - PHP 5: php5, php5-cli, php5-mysql, php-pear, php5-dev, php5-gd, libapache2-mod-php5
 - MySQL
 - PEAR: PHPUnit, PHP CodeSniffer
 - [Composer](https://getcomposer.org/)

As I reside in Singapore, I've set my VM environment to use the same timezone as my host computer. You can modify this line of code in the Vagrantfile easily (or totally remove it).

Feel free to fork and make it your own development box.