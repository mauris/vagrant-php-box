
exec{ 'apt-update':
    command => "/usr/bin/apt-get update"
}

$packages = ["curl", "vim", "git"]
package { $packages:
    ensure => installed,
    require => Exec["apt-update"]
}

class { 'apache':
    mpm_module => prefork,
    default_vhost => false
}

apache::vhost { 'default':
    docroot => '/vagrant/web',
    port => 80,
    override => ['All']
}

composer::run{ 'composer run':
    path => '/vagrant/app'
}

include apache::mod::php
include apache::mod::rewrite
include php
include composer