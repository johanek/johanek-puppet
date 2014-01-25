# = Class: admintools
#
# Install various administrative tools that all machines need
# i.e. telnet, sar, curl, strace...
#
#== Requirements
# None
#
# == Parameters
#
# None
#
class admintools {
  include admintools::install
  case $::operatingsystem {
    /(RedHat|CentOS|Scientific)/: { include admintools::service::redhat }
    default: { }
  }
}