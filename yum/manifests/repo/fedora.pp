# Class yum::repo::fedora
class yum::repo::fedora {

  yum::managed_yumrepo { 'base':
    descr       => 'Fedora $releasever - $basearch',
    mirrorlist  => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch',
    enabled     => 1,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
  }
  yum::managed_yumrepo { 'updates':
    descr       => 'Fedora $releasever - $basearch - Updates',
    mirrorlist  => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch',
    enabled     => 1,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
  }

}