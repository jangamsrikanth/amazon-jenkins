#! /bin/bash
##################################
# Author : Srikanth
# created date: 26.11.2023
# Version: 1.0
# Team : DevOps
#####################################
echo "Create RPM repository"
cat <<EOF > /etc/yum.repos.d/adoptium.repo
[Adoptium]
name=Adoptium
baseurl=https://packages.adoptium.net/artifactory/rpm/amazonlinux/2/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public
EOF
echo "install java -17"
dnf -y install temurin-17-jdk
echo "system update"
sudo yum update –y
echo " Add the Jenkins repo"
sudo wget -O /etc/yum.repos.d/jenkins.repo \ https://pkg.jenkins.io/redhat-stable/jenkins.repo
echo "Import a key file from Jenkins-CI to enable installation from the package"
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
echo "system upgrade"
sudo yum upgrade
echo "install jenkins"
sudo yum install jenkins -y
echo "Enable the Jenkins service to start at boot"
sudo systemctl enable jenkins
echo "Start Jenkins as a service"
sudo systemctl start jenkins
echo "status of the Jenkins service"
sudo systemctl status jenkins
