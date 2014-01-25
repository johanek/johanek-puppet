# Class mcollective::server
class mcollective::server {
  include mcollective::server::install
  include mcollective::server::config
  include mcollective::server::service
}
