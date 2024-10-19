#!/bin/bash
sudo apt-get install -y openvswitch-common openvswitch-switch
sudo wget -O /usr/bin/ovs-docker https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
sudo chmod 755 /usr/bin/ovs-docker
