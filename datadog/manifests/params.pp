# Class datadog::params
class datadog::params  {

  # Disable service if package absent
  $service_ensure = $datadog::enabled ? {
    false   => stopped,
    default => $datadog::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $datadog::enableboot ? {
    false   => false,
    default => $datadog::present ? {
      false   => false,
      default => true
    }
  }

  # Install version $datadog::version, otherwise remove
  $package_ensure = $datadog::present ? {
    false   => absent,
    default => $datadog::version
  }

}
