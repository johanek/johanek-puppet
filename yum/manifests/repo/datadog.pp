# Class yum::repo::datadog
class yum::repo::datadog {
  yum::managed_yumrepo { 'datadog':
    descr     => 'Datadog, Inc',
    baseurl   => 'http://yum.datadoghq.com/rpm/',
    enabled   => 1,
    gpgcheck  => 0,
  }
}