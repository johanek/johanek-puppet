# File Managed By Puppet
# a config.ru, for use with every rack-compatible webserver.
# SSL needs to be handled outside this, though.

# if puppet is not in your RUBYLIB:
# $:.unshift('/opt/puppet/lib')

$0 = "master"

# if you want debugging:
# ARGV << "--debug"

ARGV << "--rack"  
ARGV << "--confdir" << "/etc/puppet" 
require 'puppet/util/command_line' 
run Puppet::Util::CommandLine.new.execute
