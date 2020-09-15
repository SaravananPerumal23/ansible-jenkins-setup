# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #Ansible Control Server
  config.vm.define "ansibleControlServer" do |acs|
    acs.vm.box = "bento/centos-7"
    acs.vm.hostname = "acs"
    acs.vm.network "private_network", ip: "192.128.20.10"
    #Copy your local folders to remote instance
    acs.vm.provision "file", source: "./", destination: "~/ansible"
  end

  # Jenkins-Master
  config.vm.define "jenkins-master" do |jnk01|
    jnk01.vm.box = "bento/centos-7"
    jnk01.vm.hostname = "jenkins-master"
    jnk01.vm.network "private_network", ip: "192.128.20.11"
  end

  # Jenkins-Slave
  config.vm.define "jenkins-slave" do |jnk02|
    jnk02.vm.box = "bento/centos-7"
    jnk02.vm.hostname = "jenkins-slave"
    jnk02.vm.network "private_network", ip: "192.128.20.12"
  end

end
