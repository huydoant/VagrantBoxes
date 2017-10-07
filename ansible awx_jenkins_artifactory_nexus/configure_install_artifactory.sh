#!/usr/bin/env bash

###############################################################################
#                                                                             #
# Vagrant Shell Script for Ubuntu Artifactory OSS                             #
#                                                                             #
###############################################################################

# Add Jfrog repo
echo "deb https://jfrog.bintray.com/artifactory-debs xenial main" | sudo tee -a /etc/apt/sources.list
curl https://bintray.com/user/downloadSubjectPublicKey?username=jfrog | sudo apt-key add -

# Update and install artifactory
sudo apt-get update
sudo apt-get install jfrog-artifactory-oss

# Start Artifactory service
sudo systemctl start artifactory.service