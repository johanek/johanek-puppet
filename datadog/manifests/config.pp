# Class datadog::config
class datadog::config {

  file { '/etc/dd-agent/datadog.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('datadog/datadog.conf.erb'),
    notify  => Class['datadog::service'],
    require => Class['datadog::install']
  }

}
