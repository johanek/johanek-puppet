# Class mcollective::server::install
class mcollective::server::install {
  package { 'mcollective':
    ensure   => $mcollective::version,
    name     => 'mcollective',
  }

  package { 'stomp':
    ensure   => present,
    name     => 'rubygem-stomp'
  }
}