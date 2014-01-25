# Class activemq::params
class activemq::params  {

  # Disable service if package absent
  $service_ensure = $activemq::enabled ? {
    false   => stopped,
    default => $activemq::present ? {
      false   => stopped,
      default => running
    }
  }

  # Disable service boottime startup if package absent
  $service_enable = $activemq::enableboot ? {
    false   => false,
    default => $activemq::present ? {
      false   => false,
      default => true
    }
  }

  # No real need to process this parameter - $activemq::present could be called
  # directly within activemq::install
  $package_ensure = $activemq::present ? {
    false   => absent,
    default => present
  }

  # Logic for various config files
  $config_source = $activemq::default_config ? {
    true    => 'activemq/activemq_default.xml.erb',
    default => 'activemq/activemq.xml.erb'
  }



}
