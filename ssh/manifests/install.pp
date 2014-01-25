# Class ssh::install
class ssh::install {
  package { 'openssh':
    ensure => latest,
    name   => $ssh::params::ssh_name,
  }

  package { ['openssh-clients', 'rssh']:
    ensure => latest
  }

}