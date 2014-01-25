# = Class: datadog
#
# This is the main datadog class
#
#== Requirements
# Yum::repo::datadog
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
# [*apikey*]
#   API Key for datadog service
#
class datadog (
  # Parameters for Class
  $present = true,
  $enabled = true,
  $enableboot = true,
  $version = 'latest',
  $apikey = ''
){
    include datadog::params
    include datadog::install
    include datadog::service
    include datadog::config
}
