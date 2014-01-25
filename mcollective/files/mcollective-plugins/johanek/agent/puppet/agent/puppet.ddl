metadata :name        => "Puppet Runner",
         :description => "Run Puppet Agent",
         :author      => "Johan van den Dorpe",
         :license     => "Apache v2",
         :version     => "1.0",
         :url         => "http://johan.org.uk",
         :timeout     => 180

action "run", :description => "Synchronous run of puppet agent" do

  output  :status,
          :description => "Output status of command",
          :display_as  => "Output Status",
          :default     => "unknown status"

end
