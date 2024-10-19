#!/bin/bash

function set_sysctl () {
    sudo bash -c "echo '$1 = $2' >> /etc/sysctl.conf"
}

while read line
do
    set_sysctl $line
done <<EOM
    vm.max_map_count 262144
EOM

sudo systemctl stop unattended-upgrades.service
sudo systemctl disable unattended-upgrades.service
sudo apt-get purge -fy unattended-upgrades

