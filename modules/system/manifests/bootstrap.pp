class system::bootstrap {
  include system

  group { "puppet":
    ensure => present
  }
}