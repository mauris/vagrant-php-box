
exec{ 'apt-update':
    command => "/usr/bin/apt-get update"
}

$packages = ["curl", "vim", "git"]
package { $packages:
    ensure => present,
    require => Exec["apt-update"]
}

include php
include composer