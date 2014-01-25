# Class timezone::config
class timezone::config {

  file { '/etc/localtime':
    ensure => link,
    target => "/usr/share/zoneinfo/${timezone::timezone}"
  }

}
