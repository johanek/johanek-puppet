# Class ntp::params
class ntp::params  {

  # Disable service if package absent
  $service_ensure = $ntp::enabled ? {
    false   => stopped,
    default => $ntp::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $ntp::enableboot ? {
    false   => false,
    default => $ntp::present ? {
      false   => false,
      default => true
    }
  }

  # No real need to process this parameter - $ntp::present could be called
  # directly within ntp::install
  $package_ensure = $ntp::present ? {
    false   => absent,
    default => present
  }

}
