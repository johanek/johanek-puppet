# Class timezone::install
class timezone::install {
  package { 'tzdata':
    ensure => $timezone::params::package_ensure
  }
}