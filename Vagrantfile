# -*- mode: ruby -*-
# vi: set ft=ruby:fdm=marker
HOST = "33.33.33.33"
HOSTNAME = "local.slothai.com"
MEMORY = "2048"
CPUS = "8"
NFS = true

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = HOSTNAME
  config.vm.network :private_network, ip: HOST

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.name = HOSTNAME
    vb.memory = MEMORY
    vb.cpus = CPUS

    # Fix slow external network connections
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Share folders
  # to use NFS with Ubuntu: sudo apt-get install nfs-kernel-server
  config.vm.synced_folder ".", "/vagrant", :nfs => NFS
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = false

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.limit = "all"
    ansible.become = "sudo"
    ansible.verbose = "vvvv"
    ansible.host_vars = {
      "default" => {
        "ansible_python_interpreter": "/usr/bin/python3"
      }
    }
  end
end
