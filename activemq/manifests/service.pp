# Class activemq::service
class activemq::service {
  service { 'activemq':
    ensure     => $activemq::params::service_ensure,
    enable     => $activemq::params::service_enable,
    hasrestart => true,
    hasstatus  => false,
    require    => Class['activemq::install'],
    subscribe  => Class['activemq::config']
  }
}
