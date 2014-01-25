# Class apache_proxy::config
class apache_proxy::config {
  file { '/etc/httpd/conf.d/proxy.conf':
    ensure => present,
    source => 'puppet:///modules/apache_proxy/proxy.conf',
    notify => Class['apache::service']
  }

  # Purge /etc/httpd/conf.d/proxy/ contents
  file { 'purge-proxy':
    ensure  => directory,
    path    => '/etc/httpd/conf.d/proxy/',
    source  => 'puppet:///modules/apache_proxy/empty/',
    recurse => true,
    purge   => true,
    force   => true,
    mode    => '0644',
  }

}