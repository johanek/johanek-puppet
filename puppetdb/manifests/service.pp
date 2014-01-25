# Class puppetdb::service
class puppetdb::service {

  service { 'puppetdb':
    ensure  => running,
    enable  => true,
    require => [Class['puppetdb::install'],Class['puppetdb::params']]
  }

}