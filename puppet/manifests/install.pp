# Class puppet::install
class puppet::install {

  Package {
    require => [Class['ruby'],Class['puppet::params']]
  }

  package { 'puppet':
    ensure => $puppet::params::package_ensure,
  }

  package { 'facter':
    ensure => latest,
    notify => Class['puppet::service']
  }

  package { 'puppetdb-terminus':
    ensure => present
  }

}