module MCollective
  module Agent
    class Puppet<RPC::Agent

      action "run" do
        cmd = %( puppet agent --no-daemonize --onetime --no-splay )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end

    end # Class
  end # Module Agent
end # Module MCollective
