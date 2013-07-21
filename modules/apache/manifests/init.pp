class apache {
  package { "apache2":
    ensure => present,
    require => Exec["apt-get update"]
  }

  service { "apache":
    ensure => running,
    require => Package["apache2"],
  }

  file { '/var/www':
    ensure => link,
    target => "/vagrant",
    notify => Service['apache'],
    force  => true
  }
}
