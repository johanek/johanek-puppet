# Class ntp::config
class ntp::config {

  File {
    owner => root,
    group => root,
    mode  => '0644'
  }

  file { '/etc/ntp.conf':
    ensure => present,
    source => 'puppet:///modules/ntp/ntp.conf'
  }

  file { '/etc/ntp/step-tickers':
    ensure => present,
    source => 'puppet:///modules/ntp/step-tickers'
  }


}
