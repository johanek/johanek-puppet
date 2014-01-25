# class mcollective::plugins
#
# This class selects and installs mcollective-plugins from various sources
#
# The sources are based on
# puppetlabs repo : http://github.com/puppetlabs/mcollective-plugins.git
# ripienaar repo : http://github.com/ripienaar/mcollective-plugins.git
# example42 repo : http://github.com/example42/mcollective-plugins-puppi.git
# extra repo : Various sources
#
# Usage:
# include mcollective::plugins
#
class mcollective::plugins {
    include mcollective::params

#### Puppetlabs Plugins

    # puppetd plugin
    mcollective::plugin { 'agent/puppetd.rb':
      source  => 'agent/puppetd/agent/puppetd.rb',
      repo    => 'puppetlabs'
    }
    mcollective::plugin { 'agent/puppetd.ddl':
      source  => 'agent/puppetd/agent/puppetd.ddl',
      type    => 'ddl',
      repo    => 'puppetlabs'
    }
    if ( $mcollective::client == true ) {
        mcollective::plugin { 'application/puppetd.rb':
          source => 'agent/puppetd/application/puppetd.rb' ,
          repo   => 'puppetlabs'
        }
    }

    # service plugin
    mcollective::plugin { 'agent/service.rb':
      source  => 'agent/service/agent/puppet-service.rb',
      repo    => 'puppetlabs'
    }
    mcollective::plugin { 'agent/service.ddl':
      source  => 'agent/service/agent/service.ddl' ,
      type    => 'ddl',
      repo    => 'puppetlabs'
    }
    if ( $mcollective::client == true ) {
        mcollective::plugin { 'application/service.rb':
          source  => 'agent/service/application/service.rb' ,
          repo    => 'puppetlabs'
        }
    }

    # process plugin
    mcollective::plugin { 'agent/process.rb':
      source  => 'agent/process/agent/process.rb',
      repo    => 'puppetlabs'
    }
    mcollective::plugin { 'agent/process.ddl':
      source  => 'agent/process/agent/process.ddl' ,
      type    => 'ddl',
      repo    => 'puppetlabs'
    }
#    if ( $mcollective::client == true ) {
#        mcollective::plugin { 'mc-pgrep':
#          source  => 'agent/process/sbin/mc-pgrep' ,
#          type    => 'client',
#          repo    => 'puppetlabs'
#        }
#    }

  # Johanek plugins
  mcollective::plugin { 'agent/dns.ddl':
    source  => 'agent/dns/agent/dns.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/puppetcert.ddl':
    source  => 'agent/puppetcert/agent/puppetcert.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/puppetca.ddl':
    source  => 'agent/puppetca/agent/puppetca.ddl',
    type    => 'ddl',
    repo    => 'puppetlabs'
  }
  mcollective::plugin { 'agent/lxc.ddl':
    source  => 'agent/lxc/agent/lxc.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/provision.ddl':
    source  => 'agent/mcprovision/agent/provision.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/puppet.rb':
    source  => 'agent/puppet/agent/puppet.rb',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/puppet.ddl':
    source  => 'agent/puppet/agent/puppet.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/puppetdb.ddl':
    source  => 'agent/puppetdb/agent/puppetdb.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }
  mcollective::plugin { 'agent/puppetdash.ddl':
    source  => 'agent/puppetdash/agent/puppetdash.ddl',
    type    => 'ddl',
    repo    => 'johanek'
  }


}
