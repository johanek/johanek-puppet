metadata :name        => "LXC",
       :description => "Linux Container Management",
       :author      => "Johan van den Dorpe",
       :license     => "Apache v2",
       :version     => "1.0",
       :url         => "http://johan.org.uk",
       :timeout     => 60

action "create", :description => "Create a Container" do
  
  input :host,
    :prompt      => "Hostname",
    :description => "Hostname of Container",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

  input :ip,
    :prompt      => "IP address",
    :description => "IP address of Container",
    :type        => :ipv4address,
    :optional    => false,
    :maxlength   => 30

  output :status,
    :description => "Output status of command",
    :display_as  => "Output Status",
    :default     => "unknown status"

end

[ "start", "stop", "destroy" ].each do |act|
  action act, :description => "#{act.capitalize} a Container" do
  
    input :host,
      :prompt      => "Hostname",
      :description => "Hostname of Container",
      :type        => :string,
      :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
      :optional    => false,
      :maxlength   => 30

    output :status,
      :description => "Output status of command",
      :display_as  => "Output Status",
      :default     => "unknown status"

  end
end
