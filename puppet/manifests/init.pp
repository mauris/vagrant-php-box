
exec{ 'apt-update':
    command => "/usr/bin/apt-get update"
}

$packages = ["curl", "vim", "git"]
package { $packages:
    ensure => present,
    require => Exec["apt-update"]
}

class { 'apache':
    httpd_dir => '/vagrant/web',
    default_vhost => false
}

apache::vhost { 'default':
    docroot => '/vagrant/web',
    port => 80
}

include php
include composer