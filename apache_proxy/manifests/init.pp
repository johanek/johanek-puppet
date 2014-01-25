# = Class: apache_proxy
#
# Configure reverse proxy for all lxc guest nodes
#
#== Requirements
# Apache & SSL
# puppetdbquery
#
# == Parameters
# None
class apache_proxy {
  include apache_proxy::config
  $hosts = pdbnodequery(
    ['=',['fact','kernel'],'Linux'],
    [ 'and',
      [ '=', 'type', 'Class' ],
      [ '=', 'title', 'Lxc_guest' ]
      ])
  apache_proxy::host { $hosts: }
}