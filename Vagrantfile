# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "dev.local"

  # config.vm.synced_folder "../data", "/vagrant_data"

  # fix "not a tty" error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"


  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 4096
    vb.customize [
      "modifyvm", :id,
      "--hwvirtex", "on",
      "--nestedpaging", "on",
      "--largepages", "on",
      "--ioapic", "on",
      "--pae", "on",
      "--paravirtprovider", "kvm",
    ]
  end

  config.vm.provision :shell, path: "provision/install-ansible.sh"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/site.yml"
  end
end
