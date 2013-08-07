# -*- mode: ruby -*-
# vi: set ft=ruby :
@box = "precise32"
@box_url = "http://files.vagrantup.com/precise32.box"

Vagrant.configure("2") do |config|
  config.vm.define "puppet-app" do |app_config|
    app_config.vm.box = @box
    app_config.vm.box_url = @box_url 

    app_config.vm.hostname = "app"
    
    app_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--name", "puppet-app"]
    end

    app_config.vm.synced_folder "wordpress","/var/freedom35"

    app_config.vm.network :forwarded_port, guest: 80, host: 4567
    app_config.vm.network :private_network, ip: "33.33.13.37"

    app_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "application.pp"
    end
  end

  config.vm.define "puppet-db" do |db_config|
    db_config.vm.box = @box
    db_config.vm.box_url = @box_url 
    db_config.vm.hostname = "db"
    
    db_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--name", "puppet-db"]
    end

    db_config.vm.network :private_network, ip: "33.33.13.38"

    db_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "database.pp"
    end
  end
end
