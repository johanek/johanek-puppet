# Class puppetdb::config
class puppetdb::config {

  File {
    mode    => '0644',
    owner   => 'puppetdb',
    group   => 'puppetdb',
    require => Class['puppetdb::install'],
    notify  => Class['puppetdb::service']
  }

  File_line {
    path    => '/etc/puppetdb/conf.d/jetty.ini',
    require => Class['puppetdb::install'],
    notify  => Class['puppetdb::service']
  }

  file { '/etc/sysconfig/puppetdb':
    ensure => present,
    source => 'puppet:///modules/puppetdb/puppetdb.sysconfig'
  }

  file_line { 'jetty-host':
    line    => "host = ${::fqdn}",
  }

  file_line { 'jetty-port':
    line    => 'port = 8080',
  }

  file_line { 'jetty-port-premove':
    ensure  => absent,
    line    => 'port = 8090'
  }

}
