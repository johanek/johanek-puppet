# Class puppetdb::firewall
class puppetdb::firewall {

  Firewall {
    notify  => Class['iptables::config'],
    iniface => 'eth0'
  }

#  firewall { '200 allow puppetdb':
#    proto  => 'tcp',
#    dport  => '8080',
#    action => 'accept',
#  }

  firewall { '200 allow puppetdb ssl':
    proto  => 'tcp',
    dport  => '8081',
    action => 'accept',
  }
  firewall { '200 allow puppetdb ssl ipv6':
    proto     => 'tcp',
    dport     => '8081',
    action    => 'accept',
    provider  => 'ip6tables'
  }

}