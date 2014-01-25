module MCollective
  module Agent
    class Dns<RPC::Agent
      metadata :name        => "DNS",
               :description => "DNS Management",
               :author      => "Johan van den Dorpe",
               :license     => "Apache v2",
               :version     => "1.0",
               :url         => "http://johan.org.uk",
               :timeout     => 5


      require 'fog'


      action "add" do
        validate :host, String
        validate :ip, :ipv4address
        
        dns = Fog::DNS.new({
          :provider     => 'Zerigo',
          :zerigo_email => 'REDACTED',
          :zerigo_token => 'REDACTED'
        })

        zone = dns.zones.get('johan.org.uk')
        record = zone.records.create(
          :value => request[:ip],
          :name  => request[:host],
          :type  => 'A',
          :ttl   => '900'
        )
        reply[:status] = record.inspect
      end # action add


      action "delete" do
        validate :host, String

        dns = Fog::DNS.new({
          :provider     => 'Zerigo',
          :zerigo_email => 'REDACTED',
          :zerigo_token => 'REDACTED'
        })

        fqdn = "#{request[:host]}.johan.org.uk"
        recordid = dns.find_hosts(fqdn).body['hosts'].first['id']
        result = dns.delete_host(recordid)
        
        reply[:status] = result.headers.inspect

      end # action del

    end # Class
  end # Module Agent
end # Module MCollective
