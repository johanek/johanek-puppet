# Class ssh::config
class ssh::config {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0600'
  }

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Class['ssh::install'],
    notify  => Class['ssh::service']
  }

  file { '/etc/ssh/ssh_config':
    ensure  => present,
    source  => 'puppet:///modules/ssh/ssh_config',
    mode    => '0644',
    require => Class['ssh::install']
  }

  file { '/etc/rssh.conf':
    ensure  => present,
    source  => 'puppet:///modules/ssh/rssh.conf',
    mode    => '0666'
  }

}