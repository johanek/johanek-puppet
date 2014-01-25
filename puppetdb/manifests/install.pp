# Class puppetdb::install
class puppetdb::install {
  package { 'puppetdb':
    ensure  => $puppetdb::params::package_ensure,
    require => Class[puppet::service]
  }
}