# Class lxc::install
class lxc::install {

  Package {
    require => Class['libvirt']
  }

  package { 'lxc':
    ensure  => $lxc::params::package_ensure,
  }

  package { 'lxc-centos':
    ensure => $lxc::guestversion
  }

}