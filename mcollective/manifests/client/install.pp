# Class mcollective::client::install
class mcollective::client::install {
  package { 'mcollective_client':
    ensure   => $mcollective::version,
    name     => 'mcollective-client'
  }
}