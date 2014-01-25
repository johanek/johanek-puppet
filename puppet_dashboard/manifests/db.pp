# Class puppet_dashboard::db
class puppet_dashboard::db {
  class { 'mysql::grant':
    mysql_db       => $puppet_dashboard::mysql_db,
    mysql_user     => $puppet_dashboard::mysql_user,
    mysql_password => $puppet_dashboard::mysql_password,
    mysql_host     => '%'
  }

  exec { 'db-migrate':
    command => 'rake RAILS_ENV=production db:migrate',
    cwd     => '/usr/share/puppet-dashboard/',
    path    => '/usr/bin/:/usr/local/bin/',
    creates => "/var/lib/mysql/${puppet_dashboard::mysql_db}/nodes.frm",
    require => [Class[puppet_dashboard::install],Class['mysql::grant'],Class['puppet_dashboard::config']]
  }

}