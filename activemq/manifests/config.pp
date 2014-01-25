# Class activemq::config
class activemq::config {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
    require => Class['activemq::install'],
    notify  => Class['activemq::service']
  }

  file { '/etc/activemq/activemq.xml':
    ensure  => present,
    content => template($activemq::params::config_source)
  }

  file { '/etc/activemq/jetty.xml':
    ensure  => present,
    content => template('activemq/jetty.xml.erb')
  }

}