#Clean yum cache
class yum::clean {
  exec { 'yum-clean-expire-cache':
    user    => 'root',
    path    => '/usr/bin',
    command => 'yum clean expire-cache',
    require => Class['yum']
  }
}