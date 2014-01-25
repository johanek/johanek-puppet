# Class mcollective::server::service
class mcollective::server::service {
  service { 'mcollective':
    ensure     => running,
    enable     => true,
    hasrestart => false,
    hasstatus  => true,
    require    => Class['mcollective::server::install'],
    subscribe  => Class['mcollective::server::config']
  }
}