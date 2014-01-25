# Class puppet::server::install
class puppet::server::install {
  package { 'puppet-server':
    ensure  => $puppet::server::params::package_ensure,
    require => [Class['Ruby'],Class['puppet::server::params']]
  }

  if $puppet::enc == true {
    package { 'hp-enc':
      ensure => '1.5-1',
      notify => Class['puppet::server::service']
    }
  }

}
