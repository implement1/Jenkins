#!/bin/bash

sudo rm -rf /etc/apt/sources* 2>/dev/null || true
sudo rm -rf /var/lib/apt/lists/* 2>/dev/null || true
sudo touch /etc/apt/sources.list

sudo apt-get clean
sudo apt-get autoremove -y
sudo rm -rf /var/lib/apt/
