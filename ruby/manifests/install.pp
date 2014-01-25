# Class ruby::install
class ruby::install {

  Package {
    require => [Class['yum::repo::centos'],Class['yum::repo::epel']]
  }

  package { 'ruby':
    ensure => present
  }
  package { 'ruby-shadow':
    ensure  => present
  }
  package { 'ruby-devel':
    ensure   => present,
    name     => 'ruby-devel.x86_64',
    require  => Package['ruby']
  }
  package { 'rubygems':
    ensure  => present,
    require => Package['ruby-devel']
  }
}
