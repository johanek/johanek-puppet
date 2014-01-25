# = Class: puppetdb
#
# This is the main puppetdb class
#
#== Requirements
# Java
#
# == Parameters
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
class puppetdb (
  # Parameters for Class
  $present = true,
  $enabled = true,
  $enableboot = true,
  $version = 'latest'
){
    include puppetdb::params
    include puppetdb::install
    include puppetdb::service
    include puppetdb::config
    include puppetdb::firewall
}
