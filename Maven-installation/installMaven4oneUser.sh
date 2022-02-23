#!/bin/sh
# Create a t2-medium redhat server in aws with at least 4GB of RAM
#  assume sudo rights
# copy and run this script in the server as ec2-user or any user with admin priviledges
sudo hostname maven
cd /opt
sudo yum install wget nano tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
#2. Install Maven.sh
#Step1) Download the Maven Software
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.zip
sudo unzip apache-maven-3.8.4-bin.zip
sudo rm -rf apache-maven-3.8.4-bin.zip
sudo mv apache-maven-3.8.4/ maven
#Step3) Set Environmental Variable  -For Specific User eg ec2-user
echo "export M2_HOME=/opt/maven" >>  ~/.bash_profile
echo "export PATH=$PATH:$M2_HOME/bin" >> ~/.bash_profile
#step5) Check the Maven version
source ~/.bash_profile
mvn -version
