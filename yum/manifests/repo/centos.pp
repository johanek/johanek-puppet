# Class yum::repo::centos
class yum::repo::centos {
  yum::managed_yumrepo { 'base':
    descr       => 'CentOS-$releasever - Base',
    mirrorlist  => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os',
    enabled     => 1,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  }

  yum::managed_yumrepo { 'updates':
    descr       => 'CentOS-$releasever - Updates',
    mirrorlist  => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates',
    enabled     => 1,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  }

}
