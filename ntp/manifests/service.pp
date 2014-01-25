# Class ntp::service
class ntp::service {

  service { 'ntpd':
    ensure  => $ntp::params::service_ensure,
    enable  => $ntp::params::service_enable,
    require => [Class['ntp::install'],Class['ntp::params']]
  }

}