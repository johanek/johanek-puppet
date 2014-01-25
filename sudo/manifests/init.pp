# Class: sudo
#
# This module manages sudo
#
# Parameters:
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*config_file_replace*]
#     Replace configuration file with that one delivered with this module
#     Default: true
#
# Actions:
#   Installs locales package and generates specified locales
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'locales':
#     locales => [
#       'en_US.UTF-8 UTF-8',
#       'de_DE.UTF-8 UTF-8',
#       'en_GB.UTF-8 UTF-8',
#     ],
#   }
#
# [Remember: No empty lines between comments and class definition]
class sudo(
  $ensure = 'present',
  $autoupgrade = false,
  $config_file_replace = true,
) {

  include sudo::params

  case $ensure {
    /(present)/: {
      $dir_ensure = 'directory'
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $dir_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  package { $sudo::params::package:
    ensure => $package_ensure,
  }

  file { $sudo::params::config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    replace => $config_file_replace,
    source  => $sudo::params::source,
    require => Package[$sudo::params::package],
  }

  file { $sudo::params::config_dir:
    ensure  => $dir_ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0550',
    recurse => true,
    purge   => true,
    require => Package[$sudo::params::package],
  }
}
