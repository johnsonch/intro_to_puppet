class aptget {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
    }
  Exec["apt-get update"] -> Package <| |>
}
