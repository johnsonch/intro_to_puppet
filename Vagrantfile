# -*- mode: ruby -*-
# vi: set ft=ruby :
@box = "thatconference"
@box_url = "http://files.vagrantup.com/precise32.box"

Vagrant.configure("2") do |config|
  config.vm.define "puppet-demo" do |config|
    config.vm.box = @box
    config.vm.box_url = @box_url 

    config.vm.hostname = "app"
    
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--name", "puppet-demo"]
    end

    config.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = '~/.ssh/id_rsa'
      override.vm.box = 'digital_ocean'
      override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

      provider.client_id = 'opl2B0gUNh44udaKl4I6e'
      provider.api_key = 'uTTfkAo8PjX5Cv0IjcDrNlW5GUPZI3XZuGjML0dKa'
      provider.image = 'Ubuntu 13.04 x64'
      provider.region = 'San Francisco 1'
    end

    config.vm.synced_folder "wordpress","/var/freedom35"

    config.vm.network :forwarded_port, guest: 80, host: 4567
    config.vm.network :private_network, ip: "33.33.13.37"

    config.vm.provision :puppet do |puppet|
      puppet.options = ["--verbose --debug"]
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "application.pp"
    end
  end

end
