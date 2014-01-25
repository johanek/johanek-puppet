# Class puppet::params
class puppet::params  {

  # Full hostname of Puppet server
  $server = $puppet::server

  # The run interval
  $runinterval = $puppet::runinterval

  # Parameters from init.pp
  $environment = $puppet::environment

#
# Generic present/enable/enableboot logic
#

  # Disable service if package absent
  $service_ensure = $puppet::enabled ? {
    false   => stopped,
    default => $puppet::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $puppet::enableboot ? {
    false   => false,
    default => $puppet::present ? {
      false   => false,
      default => true
    }
  }

  # Manage package installation
  $package_ensure = $puppet::present ? {
    false   => absent,
    default => $puppet::version
  }

}

