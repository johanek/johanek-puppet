# = Class: ntp
#
# This is the main ntp class
#
#== Requirements
# None
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
class ntp (
  # Parameters for Class
  $present = true,
  $enabled = true,
  $enableboot = true
){
    include ntp::params
    include ntp::install
    include ntp::service
    include ntp::config
}
