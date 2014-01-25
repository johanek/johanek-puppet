# = Class: ssh
#
# Installs and configures openssh
#
#== Requirements
# None
#
# == Parameters
#
# None
#
class ssh {
  include ssh::params
  include ssh::install
  include ssh::config
  include ssh::service
  include ssh::firewall
  include ssh::auth
}