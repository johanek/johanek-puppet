metadata :name        => "Puppet CA Certificate Generator",
         :description => "Create Puppet CA Certificates",
         :author      => "Johan van den Dorpe",
         :license     => "Apache v2",
         :version     => "1.0",
         :url         => "http://johan.org.uk",
         :timeout     => 30

action "genca", :description => "Generate CA Certificate" do

  input :host,
    :prompt      => "Puppet CA Host",
    :description => "Hostname of Puppet CA",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

end

action "genhost", :description => "Generate Host Certificate" do

  input :site,
    :prompt      => "Puppet CA",
    :description => "CA to sign certificate with",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

  input :host,
    :prompt      => "Puppet Host",
    :description => "Hostname to Create Certificate",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

end

action "getpriv", :description => "Get private key for site" do

  display :always

  input :site,
    :prompt      => "Site",
    :description => "Site to get private key for",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

end

action "deletesite", :description => "Delete CA and all host keys for site" do

  input :site,
    :prompt      => "Site to delete",
    :description => "Site to delete",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

end

action "copycerts", :description => "Copy site keys to lxc host" do

  input :site,
    :prompt      => "Site keys to sync",
    :description => "Site keys to sync",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30

  input :lxchost,
    :prompt      => "LXC host for site",
    :description => "LXC host for site",
    :type        => :string,
    :validation  => '^[a-zA-Z0-9\.\-_\d]+$',
    :optional    => false,
    :maxlength   => 30


end
