# -*- mode: ruby -*-
# vi: set ft=ruby :

quantity = 3 

(1..quantity).each do |i| 
  Vagrant.configure("2") do |config|
    config.vm.define "server-vm#{i}" do |node|
      node.vm.box = "ubuntu/jammy64"
      node.vm.hostname = "server-vm#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "server-vm#{i}"
        # vb.memory = 1024
        # vb.cpus = 1
      end
    end
  end
end
