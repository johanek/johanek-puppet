# Class puppetdb::params
class puppetdb::params  {

  # Disable service if package absent
  $service_ensure = $puppetdb::enabled ? {
    false   => stopped,
    default => $puppetdb::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $puppetdb::enableboot ? {
    false   => false,
    default => $puppetdb::present ? {
      false   => false,
      default => true
    }
  }

  # No real need to process this parameter - $puppetdb::present could be called
  # directly within puppetdb::install
  $package_ensure = $puppetdb::present ? {
    false   => absent,
    default => $puppetdb::version
  }

}
