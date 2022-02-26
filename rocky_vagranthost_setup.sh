#!/bin/bash

# Initial yum update and install epel-release to add repos.
sudo yum update -y
sudo yum install yum-utils epel-release -y 

# Add repos for VirtualBox, Hashicorp (Vagrant) and Docker.
sudo yum-config-manager --add-repo https://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Update yum with new repos and then install software.
sudo yum update -y
sudo yum install -y vagrant VirtualBox-6.1 gcc make perl kernel-devel kernel-devel-4.18.0-348.el8.0.2.x86_64 elfutils-libelf-devel docker-ce docker-ce-cli containerd.io

# Download VirtualBox extension pack verison 6.1.32-149290 and install it.
curl https://download.virtualbox.org/virtualbox/6.1.32/Oracle_VM_VirtualBox_Extension_Pack-6.1.32-149290.vbox-extpack --OUTPUT Oracle_VM_VirtualBox_Extension_Pack-6.1.32-149290.vbox-extpack
echo "y" | sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.32-149290.vbox-extpack

# Add 10.10.30.0/24 network to allowed networks for VirtualBox internal networks.
echo "* 10.10.30.0/24" >> /etc/vbox/networks.conf

# Reload VirtualBox to ensure extensions and drivers are loaded correctly.
sudo /sbin/vboxconfig