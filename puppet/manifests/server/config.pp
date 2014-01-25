class puppet::server::config {

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['puppet::server::install'],
    notify  => $puppet::server::params::puppet_service
  }

  file { 'puppet.conf':
    ensure  => present,
    path    => '/etc/puppet/puppet.conf',
    content => template('puppet/server/puppet.conf.erb'),
  }

  file { 'namespaceauth.conf':
    ensure  => present,
    path    => '/etc/puppet/namespaceauth.conf',
    content => template('puppet/server/namespaceauth.conf.erb'),
  }

  file { 'auth.conf':
    ensure  => present,
    path    => '/etc/puppet/auth.conf',
    source  => 'puppet:///modules/puppet/auth.conf'
  }

  file { 'fileserver.conf':
    ensure  => present,
    path    => '/etc/puppet/fileserver.conf',
    content => template('puppet/server/fileserver.conf.erb'),
  }

  file { 'tagmail.conf':
    path    => '/etc/puppet/tagmail.conf',
    content => template('puppet/server/tagmail.conf.erb'),
  }

  file { '/etc/puppet/enc/':
    ensure => directory
  }

  file { '/var/lib/puppet/ssl':
    ensure  => directory,
    owner   => puppet,
    mode    => 'u+r',
    recurse => true
  }

  file { '/var/lib/puppet/reports':
    ensure => directory,
    path   => '/var/lib/puppet/reports',
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0750'
  }

  #Puppet DB
  file { 'puppetdb.conf':
    path    => '/etc/puppet/puppetdb.conf',
    content => template('puppet/server/puppetdb.conf.erb')
  }

  file { 'routes.yaml':
    path   => '/etc/puppet/routes.yaml',
    source => 'puppet:///modules/puppet/routes.yaml',
  }

  #ENC Config
  file { ['/etc/puppet/hieradata', '/etc/puppet/classdata', '/etc/puppet/metadata' ]:
    ensure => directory,
    mode   => '0777'
  }

  file { '/etc/puppet/enc.sh':
    content => template('puppet/server/enc.sh.erb'),
    mode    => '0755'
  }

  # Hiera
  file { '/etc/hiera.yaml':
    source  => 'puppet:///modules/puppet/hiera.yaml',
  }


} #class puppet::server::config
