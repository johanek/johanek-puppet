# Class activemq::install
class activemq::install {

  Package {
    require => [Class['java'],Class['yum']]
  }

  package { 'activemq':
    ensure  => $activemq::params::package_ensure,
  }
  # Required for mcollective
  package { 'activemq-info-provider':
        ensure => present,
  }
}