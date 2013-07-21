class extras::composer {
  include extras

  exec { "download composer":
    path => "/usr/bin:/bin:/usr/local/bin",
    command => "wget http://getcomposer.org/composer.phar -O /usr/local/bin/composer",
    require => Package["curl", "php5-cli"],
    creates => '/usr/local/bin/composer'
  }

# install composer
  file { '/usr/local/bin/composer':
    mode => '0555',
    owner => root,
    group => root,
    require => Exec['download composer']
  }
}