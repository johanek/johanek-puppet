# Class libvirt::service
class libvirt::service {

  Service {
    require => [Class['libvirt::install'],Class['libvirt::params'],Class['libvirt::config']]
  }

  service {'libvirtd':
    ensure  => $libvirt::params::service_ensure,
    enable  => $libvirt::params::service_enable,
  }

  service { ['dnsmasq', 'cgconfig', 'cgred']:
    ensure => stopped
  }

}