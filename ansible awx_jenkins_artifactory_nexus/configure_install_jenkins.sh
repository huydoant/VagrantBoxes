#!/usr/bin/env bash

###############################################################################
#                                                                             #
# Vagrant Shell Script for Ubuntu Jenkins                                     #
#                                                                             #
###############################################################################

# Add Jenkins repo
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo add-apt-repository "deb https://pkg.jenkins.io/debian binary/"

# Update and install Jenkins
sudo apt-get update
sudo apt-get -y install jenkins