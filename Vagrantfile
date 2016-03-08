# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", path: "provisioner.sh"


  config.vm.network "forwarded_port", guest: 80, host: 8888
#  config.vm.network "forwarded_port", guest: 8888, host: 9999  
  # config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"


  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
