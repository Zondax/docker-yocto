#!/bin/bash
set -e

# Install ghr
#go get -u -v github.com/tcnksm/ghr

curl https://sh.rustup.rs -sSf | bash -s -- -y
/tmp/install_rust.sh 1.54.0
