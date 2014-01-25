# Class ntp::install
class ntp::install {
  package { 'ntp':
    ensure => $ntp::params::package_ensure
  }
}