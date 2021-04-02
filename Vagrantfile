# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

#  config.vm.provision "ansible" do |ansible|
#    ansible.verbose = "vvv"
#    ansible.playbook = "playbook.yml"
#    ansible.become = "true"
#  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 1
  end

  config.vm.define "ex-pam" do |sys|
    sys.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "net1"
    sys.vm.hostname = "ex-pam"
    sys.vm.provision "shell", path: "script_3.sh"
  end


end
