# Class yum::repo::puppetlabs
class yum::repo::puppetlabs {
  yum::managed_yumrepo { 'puppetlabs':
    descr     => 'Puppet Labs Packages',
    baseurl   => 'http://yum.puppetlabs.com/el/$releasever/products/$basearch/',
    enabled   => 1,
    gpgcheck  => 0,
    gpgkey    => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

  yum::managed_yumrepo { 'puppetlabs_dependencies':
    descr     => 'Puppet Labs Packages',
    baseurl   => 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch/',
    enabled   => 1,
    gpgcheck  => 0,
    gpgkey    => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

}
