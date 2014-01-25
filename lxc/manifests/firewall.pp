# Class lxc::firewall
class lxc::firewall {

  Firewall {
    notify  => Class['iptables::config'],
    require => [Class['iptables'],Exec['remove-libvirt-nat'],Exec['remove-libvirt-mangle']]
  }

  exec { 'remove-libvirt-nat':
    command => '/sbin/iptables -F -t nat',
    onlyif  => '/sbin/iptables -L -t nat'
  }

  exec { 'remove-libvirt-mangle':
    command => '/sbin/iptables -F -t mangle',
    onlyif  => '/sbin/iptables -L -t mangle'
  }

  firewall { '100 snat for lxc network':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => 'eth0',
    source   => ['192.168.0.0/24'],
    table    => 'nat',
  }

#  firewall { '100 mangle for lxc network':
#    chain    => 'POSTROUTING',
#    jump     => 'CHECKSUM',
#    proto    => 'udp',
#    outiface => 'br0',
#    dport    => '68',
#    table    => 'mangle'
#  }

  firewall { '100 input br0 dns tcp':
    chain   => 'INPUT',
    action  => 'accept',
    dport   => '53',
    proto   => 'tcp',
    iniface => 'br0'
  }
  firewall { '100 input br0 dns tcp ipv6':
    chain     => 'INPUT',
    action    => 'accept',
    dport     => '53',
    proto     => 'tcp',
    iniface   => 'br0',
    provider  => 'ip6tables'
  }

  firewall { '100 input br0 dns udp':
    chain   => 'INPUT',
    action  => 'accept',
    dport   => '53',
    proto   => 'udp',
    iniface => 'br0'
  }
  firewall { '100 input br0 dns udp ipv6':
    chain     => 'INPUT',
    action    => 'accept',
    dport     => '53',
    proto     => 'udp',
    iniface   => 'br0',
    provider  => 'ip6tables'
  }

  firewall { '000 allow forward packets with valid state':
    chain        => 'FORWARD',
    state        => ['RELATED', 'ESTABLISHED'],
    action       => 'accept',
    outiface     => 'br0',
    destination  => '192.168.0.0/24'
  }

  firewall { '001 allow forward from br0':
    chain   => 'FORWARD',
    source  => '192.168.0.0/24',
    iniface => 'br0',
    action  => 'accept'
  }

  firewall { '999 drop all other forward to br0':
    chain   => 'FORWARD',
    iniface => 'br0',
    action  => 'reject'
  }

  firewall { '999 drop all other forward from br0':
    chain    => 'FORWARD',
    outiface => 'br0',
    action   => 'reject'
  }

  firewall { '200 allow puppetmaster':
    proto   => 'tcp',
    dport   => '8140',
    action  => 'accept',
    iniface => 'eth0'
  }
  firewall { '200 allow puppetmaster ipv6':
    proto     => 'tcp',
    dport     => '8140',
    action    => 'accept',
    iniface   => 'eth0',
    provider  => 'ip6tables'
  }

  firewall { '200 allow puppet dashboard':
    proto   => 'tcp',
    dport   => '3000',
    action  => 'accept',
    iniface => 'eth0'
  }
  firewall { '200 allow puppet dashboard ipv6':
    proto     => 'tcp',
    dport     => '3000',
    action    => 'accept',
    iniface   => 'eth0',
    provider  => 'ip6tables'
  }



}