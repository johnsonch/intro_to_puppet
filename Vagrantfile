# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "thatconference"

  config.vm.hostname = "app"
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--name", "puppet-app"]
  end


  config.vm.network :forwarded_port, guest: 80, host: 4567
  config.vm.network :private_network, ip: "33.33.13.37"
end
