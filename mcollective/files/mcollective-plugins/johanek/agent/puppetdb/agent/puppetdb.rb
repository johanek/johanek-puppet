module MCollective
  module Agent
    class Puppetdb<RPC::Agent

      action "deactivate" do
        validate :host, String
        host = "#{request[:host]}.johan.org.uk"
        ssldir = "/var/lib/puppet/ssl/master01.johan.org.uk"

        cmd = %( puppet node --ssldir=#{ssldir} deactivate #{host} )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end

    end # Class
  end # Module Agent
end # Module MCollective
