#!/bin/bash
sudo useradd -d /var/lib/jenkins -m -s /bin/bash jenkins
sudo mkdir /var/lib/jenkins/.ssh
sudo echo "ssh-rsa aass jenkins@jenkins.com" | sudo tee /var/lib/jenkins/.ssh/authorized_keys > /dev/null
sudo chmod 700 /var/lib/jenkins/.ssh
sudo chmod 644 /var/lib/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /var/lib/jenkins

sudo echo | sudo EDITOR='tee -a' visudo
sudo echo "Cmnd_Alias FIX_PERMS = /bin/rm -rf .docker" | sudo EDITOR='tee -a' visudo
sudo echo "%jenkins ALL=(ALL) NOPASSWD:FIX_PERMS" | sudo EDITOR='tee -a' visudo
