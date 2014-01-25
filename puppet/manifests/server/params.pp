# Class puppet::server::params
class puppet::server::params {

  # Get HP APIKEY
  include hp::api
  $apikey = $hp::api::apikey

  # Parameters presented to class and exported via ::params
  $report_server = $puppet::server::report_server
  $runinterval = $puppet::server::runinterval
  $servername = $puppet::server::servername
  $passenger = $puppet::server::passenger

  # Access lists for Puppetmaster access (can be an array)
  $allow = [ "*.${::domain}" , '127.0.0.0' ]

  # DB choice - to be parameterised
  $db = 'sqlite'

  # MySQL DB backend - to be parameterised
  $dbname = 'puppet'
  $dbserver = 'localhost'
  $dbuser = 'puppet'
  $dbpassword = 'puppet'

  # bindaddress
  $bindaddress = ''

#
# Generic present/enable/enableboot logic
#

  # Disable master service if package absent or running passenger
  $service_ensure = $puppet::server::enabled ? {
    false   => stopped,
    default => $puppet::server::passenger ? {
      true    => stopped,
      default => $puppet::server::present ? {
        false   => stopped,
        default => running
      }
    }
  }

  # Disable master service boottime startup if package absent or running passenger
  $service_enable = $puppet::server::enableboot ? {
    false   => false,
    default => $puppet::server::passenger ? {
      true    => false,
      default => $puppet::server::present ? {
        false   => false,
        default => true
      }
    }
  }

  # Manage package installation
  $package_ensure = $puppet::server::present ? {
    false   => absent,
    default => present
  }

  # Puppet master service class
  $puppet_service = $puppet::server::passenger? {
    true    => Class['apache::service'],
    default => Class['puppet::server::service']
  }

}
