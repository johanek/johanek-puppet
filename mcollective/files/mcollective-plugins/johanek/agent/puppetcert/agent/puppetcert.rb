module MCollective
  module Agent
    class Puppetcert<RPC::Agent
      metadata :name        => "Puppet CA Certificate Generator",
               :description => "Create Puppet CA Certificates",
               :author      => "Johan van den Dorpe",
               :license     => "Apache v2",
               :version     => "1.0",
               :url         => "http://johan.org.uk",
               :timeout     => 60

      action "genca" do
        validate :host, String
        host = request[:host]
        dir = "/opt/certs/#{host}"

        cmd = %( puppet cert --ssldir=#{dir} --ca_name="#{host}" --generate && chown -R puppet.puppet #{dir})
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end

      action "genhost" do
        validate :site, String
        validate :host, String
        site = request[:site]
        host = request[:host]
        dir = "/opt/certs/#{site}"

        cmd = %( puppet cert --ssldir=#{dir}  --generate #{host} && chown -R puppet.puppet #{dir} )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end

      action "getpriv" do
        validate :site, String
        site = request[:site]
        file = "/opt/certs/#{site}/private_keys/default-site.pem"
  begin
          key = File.read(file)
        rescue => err
          logger.error(err)
          key = "default-site not created"
        end
        reply[:key] = key
      end

      action "deletesite" do
        validate :site, String
        site = request[:site]
        dir = "/opt/certs/#{site}"
        cmd = "rm -rf #{dir}"
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end
      
      action "copycerts" do
        validate :site, String
        validate :lxchost, String
        site = request[:site]
        lxchost = request[:lxchost]
        
        srcdir = "/opt/certs/#{site}"
        destdir = "/var/lib/lxc/#{site}/rootfs/var/lib/puppet/ssl/"
        cmd = %( sudo -u certsup rsync -av #{srcdir} #{lxchost}:#{destdir} )
        reply[:status] = run(cmd, :stdout => :out, :stderr => :err, :chomp => true)
      end

    end # Class
  end # Module Agent
end # Module MCollective
