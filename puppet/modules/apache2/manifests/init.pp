class apache2{
  package {
    "apache2": 
    ensure => present,
    before => File["/etc/apache2/apache2.conf"]
  }
  service {
    "apache2":
      ensure => true,
      enable => true,
      subscribe => File["/etc/apache2/apache2.conf"]
  }
  file {
    "/etc/apache2/apache2.conf":
      source => "puppet:///modules/apache2/apache2.conf",
      mode => 664,
      owner => root,
      group => root;
    "/etc/apache2/sites-enabled/freedom35.conf":
      source => "puppet:///modules/apache2/freedom35.conf",
      owner => root,
      group => root,
      notify => Service["apache2"],
      require => Package["apache2"]
  }
}
