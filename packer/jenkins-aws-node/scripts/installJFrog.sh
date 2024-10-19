#!/bin/bash

EXPECTED_MD5="d41d8cd98f00b204e9800998ecf8427e"
FILENAME=jfrog
MAJOR=v1
VERSION=1.23.0
DESTINATION=/usr/bin

curl \
  -o $FILENAME \
  https://releases.jfrog.io/artifactory/jfrog-cli/$MAJOR/$VERSION/jfrog-cli-linux-amd64/jfrog

ACTUAL_MD5=$(md5sum $FILENAME | cut -d ' ' -f 1)

echo "Checking expected checksum (${EXPECTED_MD5}) with actual checksum (${ACTUAL_MD5})"

if [ "$EXPECTED_MD5" != "$ACTUAL_MD5" ]; then
  echo "File does not match trusted checksum"
  exit 1
fi

sudo chmod a+x $FILENAME
sudo mv $FILENAME $DESTINATION/
