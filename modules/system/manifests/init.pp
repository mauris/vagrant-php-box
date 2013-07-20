class system {
  exec { "apt-get update":
    command => '/usr/bin/apt-get update'
  }
  
  $packages = ["curl", "vim", "git"]
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}