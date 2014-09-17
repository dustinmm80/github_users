name                "github_users"
maintainer          "Dustin Collins"
maintainer_email    "dustinrcollins@gmail.com"
license             "Apache 2.0"
description         "Creates users from a Github organization or list of users"
version             "0.2.0"

long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

%w{ ubuntu }.each do |os|
  supports os
end

depends "ssh_known_hosts"
depends "sudo"
