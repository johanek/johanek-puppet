metadata :name        => "Puppet dashboard functions",
         :description => "Puppetdb dashboard functions",
         :author      => "Johan van den Dorpe",
         :license     => "Apache v2",
         :version     => "1.0",
         :url         => "http://johan.org.uk",
         :timeout     => 30

action "delete", :description => "Remove node from dashboard" do

  input :host,
        :prompt      => "Puppet Host",
        :description => "Hostname to delete",
        :type        => :string,
        :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
        :optional    => false,
        :maxlength   => 30

  output :status,
     :description => "Output status of command",
     :display_as  => "Output Status",
     :default     => "unknown status"

end
