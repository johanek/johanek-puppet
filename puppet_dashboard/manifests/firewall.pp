# Class puppet_dashboard::firewall
class puppet_dashboard::firewall {

  firewall { '200 allow puppet dashboard':
    proto   => 'tcp',
    dport   => '3000',
    action  => 'accept',
    notify  => Class['iptables::config'],
    iniface => 'eth0'
  }
  firewall { '200 allow puppet dashboard ipv6':
    proto     => 'tcp',
    dport     => '3000',
    action    => 'accept',
    notify    => Class['iptables::config'],
    iniface   => 'eth0',
    provider  => 'ip6tables'
  }

}