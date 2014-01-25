# Class iptables::service
class iptables::service {

  service { 'iptables':
    ensure  => $iptables::params::service_ensure,
    enable  => $iptables::params::service_enable,
    require => [Class['iptables::install'],Class['iptables::params']]
  }

}