# Class activemq::firewall
class activemq::firewall {
  Firewall {
    notify  => Class['iptables::config'],
    iniface => 'eth0'
  }

  firewall { '200 allow mcollective':
    proto  => 'tcp',
    dport  => '6163',
    action => 'accept',
  }
  firewall { '200 allow mcollective ipv6':
    proto     => 'tcp',
    dport     => '6163',
    action    => 'accept',
    provider  => 'ip6tables'
  }

  firewall { '200 allow activemq jetty':
    proto  => 'tcp',
    dport  => '8161',
    action => 'accept',
  }
  firewall { '200 allow activemq jetty ipv6':
    proto     => 'tcp',
    dport     => '8161',
    action    => 'accept',
    provider  => 'ip6tables'
  }

}