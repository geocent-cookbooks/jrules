maintainer       "Geocent"
license          "Apache 2.0"
description      "Installs/Configures jrules"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.10.0"

%w{ ubuntu centos redhat fedora }.each do |os|
  supports os
end

recipe "jrules::default", "Installs and configures jrules"
