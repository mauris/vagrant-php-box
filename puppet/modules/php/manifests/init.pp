class php {
  package {'php5':
    ensure => present,
    name => 'php',
    require => Exec['apt-update']
  }

  $packages = ["php5-cli", "php5-mysql", "php-pear", "php5-dev", "php5-gd", "libapache2-mod-php5"]

  package { $packages:
    ensure => present,
    require => Exec["apt-update"]
  }
}