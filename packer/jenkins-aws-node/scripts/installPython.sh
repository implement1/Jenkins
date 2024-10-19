#!/bin/bash
sudo apt-get install -y python3 python3-dev python3-venv python3-pip python2 python-is-python2
sudo ln -s /usr/bin/python3.6 /usr/local/bin/python3
sudo pip3 install tox
