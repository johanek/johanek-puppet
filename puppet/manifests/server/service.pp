# Class puppet::server::service
class puppet::server::service {
  service { 'puppetmaster':
    ensure     => $puppet::server::params::service_ensure,
    enable     => $puppet::server::params::service_enable,
    hasrestart => true,
    require    => [Class['puppet::server::install'],Class['puppet::server::config']]
  }

  if $puppet::enc == true {
    service { 'hp-enc':
      ensure => running,
      enable => true
    }
  }


}