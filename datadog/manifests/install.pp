# Class datadog::install
class datadog::install {
  package { 'datadog-agent':
    ensure => $datadog::params::package_ensure
  }
}