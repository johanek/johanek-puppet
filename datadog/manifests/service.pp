# Class datadog::service
class datadog::service {

  service { 'datadog-agent':
    ensure  => $datadog::params::service_ensure,
    enable  => $datadog::params::service_enable,
    require => [Class['datadog::install'],Class['datadog::params']]
  }

}