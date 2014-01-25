# Class timezone::params
class timezone::params  {

  # No real need to process this parameter - $timezone::present could be called
  # directly within timezone::install
  $package_ensure = $timezone::present ? {
    false   => absent,
    default => present
  }

}
