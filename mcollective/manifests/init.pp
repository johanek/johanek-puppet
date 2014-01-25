# = Class: mcollective
#
# This is the main mcollective class
#
#== Requirements
# Ruby
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
# [*server*]
#   Set to 'true' to install server components (agent)
#
# [*client*]
#   Set to 'true' to install client components (master)
#
# [*plugins*]
#   Set to 'true' to install default plugins
#
# [*version*]
#   Define version to install
#
# [*stomp_host*]
#   Stomp Host
#
# [*stomp_port*]
#   Stomp Port
#
# [*stomp_user*]
#   Stomp User
#
# [*stomp_password*]
#   Stomp Password
#
class mcollective (
  $server = true,
  $client = false,
  $present = true,
  $enabled = true,
  $enableboot = true,
  $version = '2.2.1-1.el6',
  $plugins = true,
  $stomp_host = '',
  $stomp_port = '6163',
  $stomp_user = '',
  $stomp_password = ''

){
    include mcollective::params
    if ( $mcollective::plugins == true ) { include mcollective::plugins }
    if ( $mcollective::server == true ) { include mcollective::server }
    if ( $mcollective::client == true ) { include mcollective::client }
}
