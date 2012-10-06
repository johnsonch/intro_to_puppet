# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant::Config.run do |config|
  config.vm.define "tccc-app" do |app_config|
    app_config.vm.customize ["modifyvm", :id, "--name", "tccc-app", "--memory","512"]
    app_config.vm.box = "lucid32"
    app_config.vm.host_name = "app"
    app_config.vm.forward_port 22, 2222, :auto => true
    app_config.vm.forward_port 80, 4567
    app_config.vm.network :hostonly, "33.33.13.37"

    app_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "application.pp"
    end
  end
  config.vm.define "tccc-db" do |db_config|
    db_config.vm.customize ["modifyvm", :id, "--name", "tccc-db", "--memory","512"]
    db_config.vm.box = "lucid32"
    db_config.vm.host_name = "db"
    db_config.vm.forward_port 22, 2222, :auto => true
    db_config.vm.network :hostonly, "33.33.13.38"

    db_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "database.pp"
    end
  end
end
