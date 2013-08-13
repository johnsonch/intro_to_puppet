class mysql {
  package {
    "mysql-server":
      ensure => installed,
      before => File["/etc/mysql/my.cnf"]
  }
  file {
    "/etc/mysql/my.cnf":
      owner  => root,
      group  => root,
      mode   => 644,
      source => "puppet:///modules/mysql/my.cnf"
  }
  file {
    "/var/backups/freedom35.sql":
      owner  => vagrant,
      group  => vagrant,
      mode   => 777,
      source => "puppet:///modules/mysql/freedom35.sql",
  }
  service {
    "mysql":
      ensure    => running,
      subscribe => File["/etc/mysql/my.cnf"]
  } 
  exec {
    "mysql_password":
      unless  => "mysqladmin -uroot -proot status",
      command => "mysqladmin -uroot password root",
      require => Service[mysql];
    "freedom35_db":
      unless  => "mysql -uroot -proot freedom35",
      command => "mysql -uroot -proot -e \"create database freedom35; grant all on freedom35.* to root@'%' identified by 'root';\"",
      require => Exec["mysql_password"];
    "restore db":
      command => "mysql -uroot -proot freedom35 < /var/backups/freedom35.sql",
      require => [ Exec["freedom35_db"], File["/var/backups/freedom35.sql"] ];
  }
}

