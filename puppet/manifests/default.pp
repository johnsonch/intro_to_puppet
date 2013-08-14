Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

include aptget

node default {
  include apache2
  include php
  include mysql 
}

node "puppet-app" {
  include apache2
  include php
}

node "puppet-db" {
  include mysql 
}
