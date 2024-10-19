#!/bin/bash
sudo useradd -d /var/lib/jenkins -m -s /bin/bash jenkins
sudo mkdir /var/lib/jenkins/.ssh
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD6Icn2zLnQGD3R0aKYZzANc2tYjTQOivWVoKfbbRep88SEz2RMpI7ni9Qyq8CFYRRVEczMbcOB3WDlb6s+lfzzWEWU6wPja9yqYl42wlzr0u10McFgmFdiOE6I3onHvl+FQrtu4Qqd+0y+DjGAuh+zHK8KrdJ+wJvAuoBPIHHvUGiuuUS/JmTDBisnAf7aZfX0L7wcAn4a2q/uR+XLBCi/RtPgbniDLorNKDdMnodYquMn6Sq4RT6NprrxVLgyGokmVcfRnvOYB9UX5CNo3dDDKGItyKiKifncXJSIPY4fNjjf9WaOwGWPl4S+l/ojEETfMmJRzUzhxP0aEn/n9OML jenkins@jenkins.nsone.co" | sudo tee /var/lib/jenkins/.ssh/authorized_keys > /dev/null
sudo chmod 700 /var/lib/jenkins/.ssh
sudo chmod 644 /var/lib/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /var/lib/jenkins

sudo echo | sudo EDITOR='tee -a' visudo
sudo echo "Cmnd_Alias FIX_PERMS = /bin/rm -rf .docker" | sudo EDITOR='tee -a' visudo
sudo echo "%jenkins ALL=(ALL) NOPASSWD:FIX_PERMS" | sudo EDITOR='tee -a' visudo
