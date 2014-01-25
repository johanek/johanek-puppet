# = Class: puppet::server::passenger
#
# This is the passenger config for puppet master
#
#== Requirements
# Classes: Apache, Ruby, Yum
#
# == Parameters
#
# [*none*]
#   None
#
class puppet::server::passenger {
  include apache
  include apache::ssl
  include apache::passenger
  class { 'puppet::server::passenger::config':
    servername => $puppet::servername
  }
}
