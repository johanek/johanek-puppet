# Class mcollective::server::config
class mcollective::server::config {
  file { 'mcollective.conf':
    ensure  => present,
    path    => '/etc/mcollective/server.cfg',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['mcollective::server::install'],
    notify  => Class['mcollective::server::service'],
    content => template('mcollective/server.cfg.erb'),
  }

  # Yaml based fact source for mcollective. Set $mcollective_factsource = yaml to use it (and have a lot of fun)
  file {'/etc/mcollective/facts.yaml':
    owner    => 'root',
    group    => 'root',
    mode     => '0400',
    loglevel => debug,  # this is needed to avoid it being logged and reported on every run
    # avoid including highly-dynamic facts as they will cause unnecessary template writes
    content  => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    require  => Class['mcollective::server::install']
  }

}