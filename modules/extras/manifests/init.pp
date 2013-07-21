class extras{
    class { ['apache2::mod::php', 'apache2::mod::rewrite']: }

    php::module { ['curl', 'xdebug', 'gd']:
        notify => Service['apache2']
    }
}