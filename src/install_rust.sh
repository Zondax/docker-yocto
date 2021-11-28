#!/bin/bash
set -e
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.zshrc
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.bashrc
. $HOME/.cargo/env && rustup toolchain install $@
. $HOME/.cargo/env && rustup target add armv7-unknown-linux-gnueabihf --toolchain $@
. $HOME/.cargo/env && rustup target add aarch64-unknown-linux-gnu --toolchain $@
. $HOME/.cargo/env && rustup target add aarch64-unknown-linux-musl --toolchain $@
. $HOME/.cargo/env && rustup default $@
