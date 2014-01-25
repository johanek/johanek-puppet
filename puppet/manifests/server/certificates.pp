# Class puppet::server::certificates
class puppet::server::certificates {

  Exec {
    require => [Class['puppet::install'],Class['puppet::server::config'],File['ssldir-agent']]
  }

#  exec { 'Host certificate':
#    command => "/usr/bin/puppet cert --generate ${::fqdn}",
#    creates => "/var/lib/puppet/ssl/${::fqdn}/certs/${::fqdn}.pem",
#  }

  file { 'ssldir-agent':
    ensure => directory,
    path   => "/var/lib/puppet/ssl/${puppet::server}",
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0771'
  }

  # For split agent/master config only
  if $puppet::server != $::fqdn {
    file { 'ssldir-master':
      ensure => directory,
      path   => "/var/lib/puppet/ssl/${::fqdn}",
      owner  => 'puppet',
      group  => 'puppet',
      mode   => '0771'
    }

#    exec { 'CA certificate':
#      command => '/usr/bin/puppet cert --generate',
#      creates => "/var/lib/puppet/ssl/${::fqdn}/certs/ca.pem",
#      require => [Class['puppet::install'],Class['puppet::server::config'],File['ssldir-master']]
#    }
  }

#  # Default-site certificate for management
#  exec { 'Default-site certificate':
#    command => '/usr/bin/puppet cert --generate default-site',
#    creates => "/var/lib/puppet/ssl/${::fqdn}/certs/default-site.pem",
#  }

}
