
exec{ 'apt-update':
    command => "/usr/bin/apt-get update"
}

$packages = ["curl", "vim", "git"]
package { $packages:
    ensure => installed,
    require => Exec["apt-update"]
}

package { ["mysql-server", "mysql-client"]:
    ensure => installed,
    require => Exec["apt-update"]
}