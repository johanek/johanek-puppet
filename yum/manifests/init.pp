# = Class: yum
#
# Installs and configures yum and yum repos
#
#== Requirements
# None
#
# == Parameters
#
# None
#
class yum {
  include yum::config
  include yum::install
}