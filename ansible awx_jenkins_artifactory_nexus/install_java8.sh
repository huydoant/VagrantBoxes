#!/usr/bin/env bash

###############################################################################
#                                                                             #
# Vagrant Shell Script for Ubuntu Java 9                                      #
#                                                                             #
###############################################################################

# Update and add Oracle Java Repo
sudo apt-get update
sudo add-apt-repository -y ppa:webupd8team/java

# Update and install Java 8 (Silently accept terms and conditions)
sudo apt-get update
echo "oracle-java9-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer