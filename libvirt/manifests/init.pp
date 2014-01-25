# = Class: libvirt
#
# This is the main libvirt class
#
#== Requirements
# none
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
class libvirt (
  # Parameters for Class
  $present = true,
  $enabled = true,
  $enableboot = true
) {
  # Call subclasses
  include libvirt::params
  include libvirt::install
  include libvirt::service
  include libvirt::config
}

