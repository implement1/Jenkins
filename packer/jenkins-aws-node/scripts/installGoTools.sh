#!/bin/bash

export GO_BIN_URL=https://storage.googleapis.com/golang
export GO_VERSION=1.10.1
export GOPATH=/opt/go/
export PATH=$PATH:/usr/local/go/bin/:$GOPATH/bin/
export GO_OS=linux
export GO_ARCH=amd64

sudo curl -L -o /tmp/go.tar.gz $GO_BIN_URL/go$GO_VERSION.$GO_OS-$GO_ARCH.tar.gz
sudo tar -C /usr/local/ -xzvf /tmp/go.tar.gz
sudo mkdir -p /opt/go/pkg/ /opt/go/bin/

sudo go get github.com/fullstorydev/grpcurl
sudo go install github.com/fullstorydev/grpcurl/cmd/grpcurl

sudo ln -s /opt/go/bin/grpcurl /usr/bin/grpcurl
