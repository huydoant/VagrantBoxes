#!/usr/bin/env bash

###############################################################################
#                                                                             #
# Vagrant Shell Script for Ubuntu Ansible AWX                                 #
#                                                                             #
###############################################################################

# Update and clone the ansible awx repo
sudo apt-get update
git clone https://github.com/ansible/awx

# Install pip for python
sudo apt-get -y install python-pip

# Install Docker-py
pip install docker

# Update and install dependencies for docker
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

# Add docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update and install docker-ce
sudo apt-get update
sudo apt-get -y install docker-ce

# Update and install dependencies for ansible
sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

# Install ansible awx
cd awx/installer
sudo ansible-playbook -i inventory install.yml

# Update ubuntu
sudo apt-get -y upgrade