#!/bin/bash
cd /tmp/postgres && sudo docker build -t nsone/research-postgres:latest -f pg11.Dockerfile .
sudo apt-get install -y postgresql-client
