# = Class: puppet::server
#
# This is the puppet::server class
#
#
# == Parameters
#
# [*servername*]
#   Hostname of puppet server
#
# [*passenger*]
#   Run puppet master behind apache + passenger.
#
# [*passenger_port*]
#   Port to run apache + passenger on
#
# [*runinterval*]
#   Puppet agent run interval
#
# [*report_server*]
#   Hostname of server where reports are sent
#
# [*present*]
#   Set to 'false' to remove package
#
# [*enabled*]
#   Set to 'false' to stop service
#
# [*enableboot*]
#   Set to 'false' to prevent service starting at boot
#
# [*storeconfigs*]
#   Set to true to enable puppetdb storeconfigs
#
# [*puppetdb_server*]
#   Hostname of puppetdb server
#
# [*puppetdb_port*]
#   Port for puppetdb server
#
# [*proxy*]
#   Set to true to run behind proxy. Only valid if passenger is used
#
class puppet::server (
  $servername = 'puppet',
  $passenger = false,
  $passenger_port = '8140',
  $runinterval = '1800',
  $report_server = 'puppet',
  $present = true,
  $enabled = true,
  $enableboot = true,
  $storeconfigs = false,
  $puppetdb_server = 'puppet',
  $puppetdb_port = '8081',
  $proxy = false
) {

  include puppet::server::params
  include puppet::server::install
  include puppet::server::config
  include puppet::server::service
  #include puppet::server::certificates
  include puppet::server::firewall

  if $puppet::server::passenger == true {
    include puppet::server::passenger
  }

}
