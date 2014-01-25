# = Class: iptables
#
# This is the main iptables class
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
class iptables (
  # Parameters for Class
  $present = true,
  $enabled = true,
  $enableboot = true,
  $mgmthost = ''
){
    include iptables::params
    include iptables::install
    include iptables::service
    if $iptables::enabled == true {
      include iptables::config
    }
}
