# Class lxc::config
class lxc::config {

  File {
    owner => 'root',
    group => 'root',
    require => Class['lxc::install']
  }

  file { ['/var/cache/lxc/', '/cgroup', '/usr/lib64/lxc/templates/files/']:
    ensure => directory
  }

  mount { 'cgroup':
    ensure  => mounted,
    name    => '/cgroup',
    device  => 'none',
    fstype  => 'cgroup',
    options => 'defaults',
    atboot  => true,
    require => File['/cgroup']
  }

  file {'/usr/lib64/lxc/templates/lxc-centos-6':
    ensure => present,
    source => 'puppet:///modules/lxc/lxc-centos-6',
    mode   => '0755'
  }

  file { '/etc/lxc':
    ensure => directory
  }

}
