# Class puppet::service
class puppet::service {

  Service {
    require => Class['puppet::install']
  }

  service { 'puppet':
    ensure     => $puppet::params::service_ensure,
    enable     => $puppet::params::service_enable,
    hasrestart => true,
  }

}