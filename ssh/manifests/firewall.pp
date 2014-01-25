# Class ssh::firewall
class ssh::firewall {

  Firewall {
    notify  => Class['iptables::config'],
    require => Class['iptables'],
    iniface => 'eth0'
  }

  firewall { '100 allow ssh':
    proto  => 'tcp',
    dport  => '22',
    action => 'accept',
  }
  firewall { '100 allow ssh ipv6':
    proto     => 'tcp',
    dport     => '22',
    action    => 'accept',
    provider  => 'ip6tables'
  }

}