#!/usr/bin/env bash

###############################################################################
#                                                                             #
# Vagrant Shell Script for Ubuntu ELK Stack (ElasticSearch, Kibana, Logstash) #
#                                                                             #
###############################################################################

# Update and add Oracle Java Repo
sudo apt-get update
sudo add-apt-repository -y ppa:webupd8team/java

# Update and install Java 9 (Silently accept terms and conditions)
sudo apt-get update
echo "oracle-java9-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java9-installer
# sudo apt install -y oracle-java9-set-default

# Add ELK stack repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Add https transport to download ELK stack
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

# Download and install Elasticsearch
sudo apt-get update && sudo apt-get install elasticsearch

# Set up service to automatically start at system boot and start an instance of the service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

# Download and install Kibana
sudo apt-get update && sudo apt-get install kibana

# Set up service to automatically start at system boot and start an instance of the service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service

# Download and install Logstash
sudo apt-get update && sudo apt-get install logstash

# Download and install updates (Silently confirm all updates)
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# Changing file permissions to modify ElasticSearch and Kibana configuraiton files
sudo chmod 777 /etc/elasticsearch
sudo chmod 777 /etc/elasticsearch/elasticsearch.yml
sudo chmod 777 /etc/kibana/kibana.yml

# Copying correct ElasticSearch and Kibana configuration for port forwarding with guest VM
cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cp /vagrant/kibana.yml /etc/kibana/kibana.yml

# Resecuring ElasticSearch File Permissions
sudo chmod 660 /etc/elasticsearch/elasticsearch.yml
sudo chmod 750 /etc/elasticsearch

# Resecuring Kibana File Permissions
sudo chmod 644 /etc/kibana/kibana.yml

# Restart ElasticSearch and Kibana to apply new settings
sudo service elasticsearch restart
sudo service kibana restart