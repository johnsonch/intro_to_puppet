# -*- mode: ruby -*-
# vi: set ft=ruby :
@box = "precise32"
@box_url = "http://files.vagrantup.com/precise32.box"
Vagrant.configure("2") do |config|
  config.vm.box = @box
  config.vm.box_url = @box_url 

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
