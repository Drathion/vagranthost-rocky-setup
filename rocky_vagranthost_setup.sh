!/bin/bash

sudo yum update -y
sudo yum install yum-utils epel-release -y 


sudo yum-config-manager --add-repo https://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum update -y

sudo yum install Vagrant VirtualBox-6.1
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack
sudo yum install gcc make perl kernel-devel kernel-devel-4.18.0-348.el8.0.2.x86_64 -y
sudo yum install -y elfutils-libelf-devel
sudo yum install docker-ce docker-ce-cli containerd.io

echo "* 10.10.30.0/24" >> /etc/vbox/networks.conf