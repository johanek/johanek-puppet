module MCollective
  module Agent
    class Puppetdash<RPC::Agent

      action "delete" do
        validate :host, String
        host = "#{request[:host]}.johan.org.uk"

        cmd = %( rake RAILS_ENV=production -f /usr/share/puppet-dashboard/Rakefile node:del name=#{host} )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end

    end # Class
  end # Module Agent
end # Module MCollective
