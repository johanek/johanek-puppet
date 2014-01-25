# = Class: lxc
#
# This is the main lxc class
#
#== Requirements
# libvirt
#
# == Parameters
#
# [*present*]
#   Set to 'false' to remove package
#
# [*guestversion*]
#   Build of centos guest to install
#
class lxc (
  # Parameters for Class
  $present = true,
  $guestversion = '1.0'
) {
  # Call subclasses
  include lxc::params
  include lxc::install
  include lxc::config
  include lxc::firewall
}

