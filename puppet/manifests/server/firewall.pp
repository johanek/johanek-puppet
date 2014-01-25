# Class puppet::server::firewall
class puppet::server::firewall {

  Firewall {
    notify  => Class['iptables::config'],
    iniface => 'eth0'
  }

  firewall { '200 allow puppetmaster':
    proto  => 'tcp',
    dport  => '8140',
    action => 'accept',
  }

  if $puppet::enc == true {
    firewall { '200 allow ENC API':
      proto  => 'tcp',
      dport  => '2929',
      action => 'accept',
    }
    firewall { '200 allow ENC API ipv6':
      proto     => 'tcp',
      dport     => '2929',
      action    => 'accept',
      provider  => 'ip6tables'
    }
  }
}