# Class libvirt::install
class libvirt::install {
  package { 'libvirt':
    ensure  => $libvirt::params::package_ensure,
  }
}