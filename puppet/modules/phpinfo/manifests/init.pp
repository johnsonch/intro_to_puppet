class phpinfo{
  file {
    "/etc/apache2/sites-enabled/info.conf":
      source => "puppet:///modules/phpinfo/info.conf",
      owner => root,
      group => root,
      require => Package["apache2"]
  }
  
  exec {'info-site-permission':
    command => 'sudo chmod -R 775 /var/www/info',
    require => Exec["clone-info"]
  }
  exec {'clone-info':
    command => 'sudo mkdir /var/www/info; sudo wget https://raw.github.com/gist/3845052/6f252a30e345a3b1d3659f059d472bd32f3a04bb/info.php -O /var/www/info/info.php',
    require => Package["git-core"]
  }
}
