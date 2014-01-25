# Class yum::config
class yum::config {

  File {
    owner   => 'root',
    group   => 'root',
  }

  # Purge /etc/yum.repos.d contents
  file { 'yum_repos_d':
    ensure  => directory,
    path    => '/etc/yum.repos.d/',
    source  => 'puppet:///modules/yum/empty/',
    recurse => true,
    purge   => true,
    force   => true,
    mode    => '0644',
  }
  file { 'rpm_gpg':
    path    => '/etc/pki/rpm-gpg/',
    source  => 'puppet:///modules/yum/rpm-gpg',
    recurse => true,
    purge   => true,
    mode    => '0600',
  }
}