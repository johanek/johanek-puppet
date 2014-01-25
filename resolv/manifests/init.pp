# = Class: resolv
#
# Manage /etc/resolv.conf
#
#== Requirements
# None
#
# == Parameters
# None
class resolv {
  file { '/etc/resolv.conf':
    ensure => present,
    source => 'puppet:///modules/resolv/resolv.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }
}