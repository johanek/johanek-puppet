module MCollective
  module Agent
    class Lxc<RPC::Agent
      metadata :name        => "LXC",
               :description => "Linux Container Management",
               :author      => "Johan van den Dorpe",
               :license     => "Apache v2",
               :version     => "1.0",
               :url         => "http://johan.org.uk",
               :timeout     => 30

      action "create" do
        validate :host, String
        validate :ip, :ipv4address
        
        hostname = "#{request[:host]}.johan.org.uk"
        conf = <<-eos
        lxc.network.type = veth
        lxc.network.flags = up
        lxc.network.link = br0
        lxc.network.name = eth0
        lxc.network.ipv4 = #{request[:ip]}/24
        eos
        conffile = "/etc/lxc/#{hostname}"
        
        File.open(conffile, 'w') { |f| f.write(conf) }

        cmd = %( lxc-create -n #{hostname} -f #{conffile} -t 'centos-6' )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)        
      end

      action "start" do
        validate :host, String
        
        hostname = "#{request[:host]}.johan.org.uk"
        cmd = %( lxc-start -n #{hostname} -d )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)        
      end

      action "stop" do
        validate :host, String
        
        hostname = "#{request[:host]}.johan.org.uk"
        cmd = %( lxc-stop -n #{hostname} )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)        
      end

      action "destroy" do
        validate :host, String
        
        hostname = "#{request[:host]}.johan.org.uk"
        cmd = %( lxc-destroy -n #{hostname} )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)        
      end

    end # Class
  end # Module Agent
end # Module MCollective
