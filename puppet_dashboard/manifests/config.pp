# Class puppet_dashboard::config
class puppet_dashboard::config {

  File {
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['puppet_dashboard::install'],
    notify  => Class['puppet_dashboard::service']
  }

  file { '/usr/share/puppet-dashboard/config/settings.yml':
    ensure  => present,
    content => template('puppet_dashboard/settings.yml.erb')
  }

  file { '/usr/share/puppet-dashboard/config/database.yml':
    ensure  => present,
    content => template('puppet_dashboard/database.yml.erb')
  }

}
