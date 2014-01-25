# Class libvirt::params
class libvirt::params {

  # Disable service if package absent
  $service_ensure = $libvirt::enabled ? {
    false   => stopped,
    default => $libvirt::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $libvirt::enableboot ? {
    false   => false,
    default => $libvirt::present ? {
      false   => false,
      default => true
    }
  }

  # No real need to process this parameter - $libvirt::present could be called
  # directly within libvirt::install
  $package_ensure = $libvirt::present ? {
    false   => absent,
    default => present
  }

}