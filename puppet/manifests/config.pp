# Class puppet::config
class puppet::config {

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['puppet::install'],
    notify  => Class['puppet::service']
  }

  file { 'puppet.conf':
      ensure  => present,
      path    => '/etc/puppet/puppet.conf',
      content => template('puppet/client/puppet.conf.erb'),
  }

  file { 'namespaceauth.conf':
      ensure  => present,
      path    => '/etc/puppet/namespaceauth.conf',
      content => template('puppet/client/namespaceauth.conf.erb'),
  }

  file { 'ssldir':
    ensure => directory,
    path   => "/var/lib/puppet/ssl/${puppet::server}",
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0771'
  }

}