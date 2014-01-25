# Class java::install
class java::install {
  package { 'java-1.6.0-openjdk':
    ensure => present
  }
}