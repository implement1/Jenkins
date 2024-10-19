#!/bin/bash
sudo apt-get update && \
  sudo apt-get install -y \
    curl \
    git \
    make \
    build-essential \
    jq \
    systemtap \
    atop \
    linux-headers-aws linux-headers-generic
