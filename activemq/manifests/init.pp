# = Class: activemq
#
# This is the main activemq class
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
# [*mcollective*]
#   Enable mcollective queue
#
# [*mcollective_stompuser*]
#   Stomp user for mcollective
#
# [*mcollective_stomppassword*]
#   Stomp password for mcollective
#
# [*stompport*]
#   Port to run stomp on
#
# [*puppet_queue*]
#   Enable support for puppet queue
#
# [*default_config*]
#   Enable default config
#
class activemq (
  $present = true,
  $enabled = true,
  $enableboot = true,
  $mcollective = false,
  $mcollective_stompuser = '',
  $mcollective_stomppassword = '',
  $stompport = '6163',
  $default_config = false
){
  include activemq::params
  include activemq::install
  include activemq::config
  include activemq::service
  include activemq::firewall
}