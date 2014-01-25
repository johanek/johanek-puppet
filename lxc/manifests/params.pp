# Class lxc::params
class lxc::params {

  # No real need to process this parameter - $lxc::present could be called
  # directly within lxc::install
  $package_ensure = $lxc::present ? {
    false   => absent,
    default => present
  }

}