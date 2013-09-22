
exec{ 'apt-update':
    command => "/usr/bin/apt-get update"
}

$packages = ["curl", "vim", "git"]
package { $packages:
    ensure => present,
    require => Exec["apt-update"]
}

class { 'apache':
    httpd_dir => '/vagrant/web'
}

include php
include composer