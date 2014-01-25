# Class mcollective::client::config
class mcollective::client::config {
  file { 'mcollective_client.conf':
    ensure  => present,
    path    => '/etc/mcollective/client.cfg',
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    require => Class['mcollective::client::install'],
    content => template('mcollective/client.cfg.erb'),
  }
}