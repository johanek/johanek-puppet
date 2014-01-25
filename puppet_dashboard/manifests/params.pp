# Class puppet_dashboard::params
class puppet_dashboard::params  {

  # Disable service if package absent
  $service_ensure = $puppet_dashboard::enabled ? {
    false   => stopped,
    default => $puppet_dashboard::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $puppet_dashboard::enableboot ? {
    false   => false,
    default => $puppet_dashboard::present ? {
      false   => false,
      default => true
    }
  }

  # Package installation
  $package_ensure = $puppet_dashboard::present ? {
    false   => absent,
    default => $puppet_dashboard::version
  }

}
