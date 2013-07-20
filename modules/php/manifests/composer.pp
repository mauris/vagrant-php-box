class php::composer {
  include php

# download composer
  exec { "download composer":
    path => "/usr/bin:/bin:/usr/local/bin",
    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant",
    require => Package["curl", "php5-cli"]
  }

# install composer
  file { "/usr/local/bin/composer":
    ensure => present,
    source => "/home/vagrant/composer.phar",
    require => Exec['download composer'],
    group => 'staff',
    mode => '0755'
  }

# update composer
  exec { "update composer":
    command => "/usr/local/bin/composer selfupdate",
    require => File["/usr/local/bin/composer"]
  }
}