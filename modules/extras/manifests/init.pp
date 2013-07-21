class extras{
    class { ['apache2::mod::php', 'apache2::mod::rewrite']: }

    class { "apache":
      version =>  '2.2.22'
    }

    php::module { ['curl', 'xdebug', 'gd']:
        notify => Service['apache2']
    }
}