# = Class: puppet::server::passenger::config
#
# This is the passenger config for puppet master
#
#== Requirements
# Classes: Apache, Ruby, Yum
#
# == Parameters
#
# [*servername*]
#   Server name to present as (puppet cname)
#
class puppet::server::passenger::config (
  $servername = ''
){

  File {
    owner => 'puppet',
    group => 'puppet'
  }

  file { ['/etc/puppet/puppetmaster', '/etc/puppet/puppetmaster/rack', '/etc/puppet/puppetmaster/rack/public', '/etc/puppet/puppetmaster/rack/tmp']:
    ensure => directory,
  }

  file { '/etc/puppet/puppetmaster/rack/config.ru':
    mode   => '0644',
    source => 'puppet:///modules/puppet/config.ru',
  }

  apache::vhost { 'puppetmaster':
    port        => $puppet::server::passenger_port,
    priority    => '20',
    docroot     => '/etc/puppet/puppetmaster/rack/public/',
    template    => 'puppet/passenger/puppetmaster.conf.erb',
    servername  => $servername
  }
}

