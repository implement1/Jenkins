#!/bin/bash
sudo apt-get install -y calico-felix 
sudo mv /tmp/felix.cfg /etc/calico/
sudo mv /tmp/localhost.crt /etc/calico/
sudo mv /tmp/localhost.key /etc/calico/
sudo mv /tmp/ca.crt /etc/calico/
