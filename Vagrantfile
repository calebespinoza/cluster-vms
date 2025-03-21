# -*- mode: ruby -*-
# vi: set ft=ruby :

quantity = 3 

(1..quantity).each do |i| 
  Vagrant.configure("2") do |config|
    config.vm.define "server-vm#{i}" do |node|
      if "server-vm#{i}" == "server-vm1"
        node.vm.network "forwarded_port", guest: 9090, host: 9091, id: "prometheus"
        node.vm.network "forwarded_port", guest: 3000, host: 3001, id: "grafana"
      end
      node.vm.network "forwarded_port", guest: 9100, host: "910#{i}", id: "node_exporter"
      node.vm.box = "ubuntu/jammy64"
      node.vm.hostname = "server-vm#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "server-vm#{i}"
        # vb.memory = 1024
        # vb.cpus = 1
      end
      node.vm.provision "docker"
      node.vm.provision "shell",
        path: "prometheus.sh"
    end
  end
end
