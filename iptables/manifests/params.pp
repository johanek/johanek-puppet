# Class iptables::params
class iptables::params  {

  # Disable service if package absent
  $service_ensure = $iptables::enabled ? {
    false   => stopped,
    default => $iptables::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $iptables::enableboot ? {
    false   => false,
    default => $iptables::present ? {
      false   => false,
      default => true
    }
  }

  # No real need to process this parameter - $iptables::present could be called
  # directly within iptables::install
  $package_ensure = $iptables::present ? {
    false   => absent,
    default => present
  }

}
