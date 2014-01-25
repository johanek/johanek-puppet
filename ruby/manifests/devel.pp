# Class ruby::devel
class ruby::devel {
  package { 'rubygem-rake':
    ensure => present
  }
}