# -*- mode: ruby -*-
# vi: set ft=ruby :

quantity = 3 

(1..quantity).each do |i| 
  Vagrant.configure("2") do |config|
    config.vm.define "server-vm#{i}" do |node|
      node.vm.network "forwarded_port", guest: 9090, host: "909#{i}", id: "prometheus"
      node.vm.network "forwarded_port", guest: 9100, host: "910#{i}", id: "node_exporter"
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
