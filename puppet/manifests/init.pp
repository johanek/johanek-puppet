# = Class: puppet
#
# This is the main puppet class
#
#== Requirements
# Ruby class
# If passenger is set to true, then apache class is required
#
# == Parameters
#
# [*server*]
#   Hostname of puppet server
#
# [*environment*]
#   Environment to configure in puppet agent.
#
# [*runinterval*]
#   Frequency of puppet runs
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
# [*version*]
#   Version to install
#
# == Server Specific Parameters
#
# [*puppet_server*]
#   Set to 'true' to install puppet master
#
# [*passenger*]
#   Set to true to run puppet master behind apache + passenger
#
# [*passenger_port*]
#   Port to run apache + passenger on
#
# [*report_server*]
#   Hostname of server where reports are sent
#
# [*servername*]
#   Server name to present ourselves as. Default: FQDN
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
# [*dashboard_server*]
#   Hostname of puppet dashboard server
#
# [*dashboard_port*]
#   Port for puppet dashboard
#
# [*proxy*]
#   Set to true to run behind proxy. Only valid if passenger is used
#
# [*enc*]
#   Set to true to enable and run ENC
#
class puppet (
  $server = 'puppet',
  $runinterval = '1800',
  $present = true,
  $enabled = true,
  $enableboot = true,
  $puppet_server = false,
  $passenger = false,
  $passenger_port = '8140',
  $report_server = 'puppet',
  $servername = $::fqdn,
  $storeconfigs = false,
  $environment = false,
  $puppetdb_server = 'puppet',
  $puppetdb_port = '8081',
  $dashboard_server = '',
  $dashboard_port = '3000',
  $version = 'latest',
  $proxy = false,
  $enc = false
){
  include puppet::params
  include puppet::install
  include puppet::service

  # Both the agent and server use /etc/puppet.conf & Puppet master
  # requires
  if $puppet::puppet_server == true {
    class {'puppet::server':
      servername              => $puppet::servername,
      runinterval             => $puppet::runinterval,
      present                 => $puppet::present,
      enabled                 => $puppet::enabled,
      enableboot              => $puppet::enableboot,
      report_server           => $puppet::report_server,
      passenger               => $puppet::passenger,
      passenger_port          => $puppet::passenger_port,
      storeconfigs            => $puppet::storeconfigs,
      puppetdb_server         => $puppet::puppetdb_server,
      puppetdb_port           => $puppet::puppetdb_port,
      proxy                   => $puppet::proxy
    }
  } else {
    include puppet::config
  }
}
