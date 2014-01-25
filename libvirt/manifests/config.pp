# Class libvirt::config
class libvirt::config {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
    require => Class['libvirt::install']
  }

  file { '/etc/libvirt/libvirtd.conf':
    ensure => present,
    source => 'puppet:///modules/libvirt/libvirtd.conf',
    notify => Class['libvirt::service']
  }

  file { '/etc/libvirt/qemu/networks/default.xml':
    ensure => present,
    source => 'puppet:///modules/libvirt/default.xml',
    notify => Class['libvirt::service']
  }


}