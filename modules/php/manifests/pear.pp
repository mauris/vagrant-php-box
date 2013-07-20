class php::pear {
  include php

# upgrade PEAR
  exec { "pear upgrade":
    path => "/usr/bin:/bin:/usr/local/bin",
    require => Package["php-pear"]
  }

# install PHPUnit
  exec { "pear config-set auto_discover 1":
    path => "/usr/bin:/bin:/usr/local/bin",
    require => Exec["pear upgrade"]
  }

# create pear temp directory for channel-add
  file { "/tmp/pear/temp":
    require => Exec["pear config-set auto_discover 1"],
    ensure => "directory",
    owner => "root",
    group => "root",
    mode => 777
  }

# discover channels
  exec { "pear channel-discover pear.phpunit.de; true":
    path => "/usr/bin:/bin:/usr/local/bin",
    require => [File["/tmp/pear/temp"], Exec["pear config-set auto_discover 1"]]
  }

# clear cache before install phpunit
  exec { "pear clear-cache":
    path => "/usr/bin:/bin:/usr/local/bin",
    require => Exec["pear channel-discover pear.phpunit.de; true"]
  }

# install phpunit
  exec { "pear install -a -f phpunit/PHPUnit":
    path => "/usr/bin:/bin:/usr/local/bin",
    require => Exec["pear clear-cache"]
  }

# install PHP Code Sniffer
  exec { "pear install -a -f pear/PHP_CodeSniffer":
    path => "/usr/bin:/bin:/usr/local/bin",
    require => Exec["pear clear-cache"]
  }
}