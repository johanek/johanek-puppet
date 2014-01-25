# Class iptables::install
class iptables::install {
  package { ['iptables', 'iptables-ipv6']:
    ensure => $iptables::params::package_ensure
  }
}