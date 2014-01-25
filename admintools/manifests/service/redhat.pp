# Class admintools::service::redhat
class admintools::service::redhat {
  service { 'sysstat':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}
