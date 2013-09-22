# Class: composer
#
# Installs Composer
class composer (
) inherits composer::params {

  exec { "curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant && mv /home/vagrant/composer.phar ${install_location}/${filename}":
    path    => ['/usr/bin', '/bin'],
    creates => "${install_location}/${filename}",
    require => Package['php'],
  }
}
