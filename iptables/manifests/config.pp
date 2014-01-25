# Class iptables::config
class iptables::config {

  # Always persist firewall rules
  exec { 'persist-firewall':
    command     => '/sbin/iptables-save > /etc/sysconfig/iptables',
    refreshonly => true
  }
  exec { 'persist-firewall6':
    command     => '/sbin/ip6tables-save > /etc/sysconfig/ip6tables',
    refreshonly => true
  }

  Firewall {
    notify  => [Exec['persist-firewall'],Exec['persist-firewall6']],
    iniface => 'eth0'
  }

  firewall { '000 allow packets with valid state':
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }
  firewall { '000 allow packets with valid state ipv6':
    state     => ['RELATED', 'ESTABLISHED'],
    action    => 'accept',
    provider  => 'ip6tables'
  }
  firewall { '001 allow icmp':
    proto   => 'icmp',
    action  => 'accept',
  }
  firewall { '001 allow icmp ipv6':
    proto     => 'icmp',
    action    => 'accept',
    provider  => 'ip6tables'
  }
  firewall { '002 allow all to lo interface':
    iniface => 'lo',
    action  => 'accept',
  }
  firewall { '002 allow all to lo interface ipv6':
    iniface   => 'lo',
    action    => 'accept',
    provider  => 'ip6tables'
  }
  firewall { '999 drop everything else':
    action => 'drop',
  }
  firewall { '999 drop everything else ipv6':
    action    => 'drop',
    provider  => 'ip6tables'
  }

  resources { 'firewall':
    purge => true
  }


}
