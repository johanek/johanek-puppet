# Class puppet_dashboard::service
class puppet_dashboard::service {

  Service {
    require => [Class['puppet_dashboard::install'],Class['puppet_dashboard::params'],Class['puppet_dashboard::db']]
  }

  service { 'puppet-dashboard':
    ensure => stopped,
    enable => false
  }

  service { 'puppet-dashboard-workers':
    ensure  => running,
    enable  => true
  }

}