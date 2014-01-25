# Class yum::repo::passenger
class yum::repo::passenger {
  yum::managed_yumrepo { 'passenger':
    descr     => 'Passenger',
    baseurl   => 'http://passenger.stealthymonkeys.com/rhel/$releasever/$basearch',
    enabled   => 1,
    gpgcheck  => 0,
  }
}
