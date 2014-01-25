# puppet_dashboard::vhost
class puppet_dashboard::vhost {
  require apache
  require apache::passenger
    
  apache::vhost { 'dashboard':
    servername  => $::fqdn,
    port        => '3000',
    docroot     => '/usr/share/puppet-dashboard/public/',
    options     => 'None',
    template    => 'puppet_dashboard/vhost-dashboard.conf.erb'
  }
  
}