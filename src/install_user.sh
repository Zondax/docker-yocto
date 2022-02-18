#!/bin/bash
set -e

# Install ghr
#go get -u -v github.com/tcnksm/ghr

curl https://sh.rustup.rs -sSf | bash -s -- -y
/tmp/install_rust.sh 1.58.1

git config --global user.email "hello@zondax.ch"
git config --global user.name "zondax"
git config --global color.ui true

ZSH_THEME=agnoster
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""  --unattended
cd $HOME; \
   git clone https://github.com/gpakosz/.tmux.git; \
   ln -s -f .tmux/.tmux.conf ; \
   cp .tmux/.tmux.conf.local .
