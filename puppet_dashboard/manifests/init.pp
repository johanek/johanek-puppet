# = Class: puppet_dashboard
#
# This is the main puppet_dashboard class
#
#== Requirements
# Mysql
#
# == Parameters
#
# [*mysql_db*]
#   Mysql Database
#
# [*mysql_user*]
#   Mysql Username
#
# [*mysql_password*]
#   Mysql Password
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
class puppet_dashboard (
  # Parameters for Class
  $present = true,
  $enabled = true,
  $enableboot = true,
  $mysql_user = 'dashboard',
  $mysql_password = 'dashboard',
  $mysql_db = 'dashboard_production',
  $version = 'latest'
){
    include puppet_dashboard::params
    include puppet_dashboard::install
    include puppet_dashboard::service
    include puppet_dashboard::config
    include puppet_dashboard::db
    include puppet_dashboard::firewall
    include puppet_dashboard::vhost
}
