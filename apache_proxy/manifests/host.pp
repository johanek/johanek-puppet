#= Define: apache_proxy::host
#
# Configure reverse proxy for a lxc guest
#
#== Requirements
# Apache & SSL
# puppetdbquery
#
# == Parameters
# None
define apache_proxy::host() {
  File {
    owner => root,
    group => root,
    mode  => '0644'
  }

  $hostip = pdbfactquery($name, 'ipaddress')

  file { "/etc/httpd/conf.d/proxy/proxy-${name}.conf":
    ensure  => present,
    content => template('apache_proxy/proxy.erb'),
    notify  => Class['apache::service'],
    require => Class['apache_proxy::config']
  }
}
