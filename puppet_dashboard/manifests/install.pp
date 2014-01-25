# Class puppet_dashboard::install
class puppet_dashboard::install {
  package { 'puppet-dashboard':
    ensure => $puppet_dashboard::params::package_ensure
  }
}