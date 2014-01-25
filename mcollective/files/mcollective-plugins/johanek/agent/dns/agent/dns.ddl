metadata :name        => "DNS",
       :description => "DNS Management",
       :author      => "Johan van den Dorpe",
       :license     => "Apache v2",
       :version     => "1.0",
       :url         => "http://johan.org.uk",
       :timeout     => 5

action "add", :description => "Add DNS Entry" do
  
  input :host,
    :prompt      => "Hostname",
    :description => "Hostname",
    :type        => :string,
    :validation  => '^[a-zA-Z\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

  input :ip,
    :prompt      => "IP address",
    :description => "IP address",
    :type        => :ipv4address,
    :optional    => false,
    :maxlength   => 30

  output :status,
    :description => "Output status of command",
    :display_as  => "Output Status",
    :default     => "unknown status"

end

action "delete", :description => "Delete DNS Entry" do
  
  input :host,
    :prompt      => "Hostname",
    :description => "Hostname",
    :type        => :string,
    :validation  => '^[a-zA-Z\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

  output :status,
    :description => "Output status of command",
    :display_as  => "Output Status",
    :default     => "unknown status"

end

