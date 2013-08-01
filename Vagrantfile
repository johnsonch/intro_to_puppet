# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "precise32"

  config.vm.hostname = "app"
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--name", "puppet-app"]
  end


  config.vm.network :forwarded_port, guest: 80, host: 4567
  config.vm.network :private_network, ip: "33.33.13.37"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "application.pp"
  end
end
