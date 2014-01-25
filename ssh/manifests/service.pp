# Class ssh::service
class ssh::service {
  service { 'sshd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class[ssh::install]
  }
}