# Class ssh::params
class ssh::params {
  case $::operatingsystem {
    /RedHat|CentOS|Scientific/:   { $ssh_name = 'openssh' }
    default:                      { $ssh_name = 'openssh' }
  }
}