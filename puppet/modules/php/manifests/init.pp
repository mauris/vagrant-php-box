class php {
  package {'php5':
    ensure => installed,
    alias => 'php',
    require => Exec['apt-update'],
    notify => Service['apache2']
  }

  $packages = ["php5-cli", "php5-cgi", "php5-mysql", "php-pear", "php5-dev", "php5-gd", "php-apc"]

  package { $packages:
    ensure => installed,
    require => Exec["apt-update"],
    notify => Service['apache2']
  }

  exec { "pear upgrade":
    command => "/usr/bin/pear upgrade",
    require => Package["php-pear"]
  }

  exec { "pear auto_discover":
    command => "/usr/bin/pear config-set auto_discover 1",
    require => Package["php-pear"]
  }

  exec { "phpunit-install":
    command => "/usr/bin/pear install pear.phpunit.de/PHPUnit",
    require => Package["php-pear"]
  }

  exec { "phpcs-install":
    command => "/usr/bin/pear install PHP_CodeSniffer",
    require => Package["php-pear"]
  }
}