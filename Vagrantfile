# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "puppet-app" do |app_config|
    app_config.vm.box = "precise32"

    app_config.vm.hostname = "app"
    # config.vm.box_url = "http://domain.com/path/to/above.box"
    app_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--name", "puppet-app"]
    end

    app_config.vm.network :forwarded_port, guest: 80, host: 4567
    app_config.vm.network :private_network, ip: "33.33.13.37"

    app_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "application.pp"
    end
  end

  config.vm.define "puppet-db" do |db_config|
    db_config.vm.box = "precise32"
    db_config.vm.hostname = "db"
    # config.vm.box_url = "http://domain.com/path/to/above.box"
    #
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
