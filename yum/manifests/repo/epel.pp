# Class yum::repo::epel
class yum::repo::epel {
  yum::managed_yumrepo { 'epel':
    descr       => 'Extra Packages for Enterprise Linux $releasever - $basearch',
    mirrorlist  => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    enabled     => 1,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  }
}
