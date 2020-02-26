#!/bin/bash

# create seamonkey directory if its missing
if [ ! -d /usr/share/seamonkey ]; then
    sudo mkdir /usr/share/seamonkey &&
    sudo chown "$USER" /usr/share/seamonkey || exit 1
fi

# get path to untility folder
script_path="$( cd "$(dirname "$0")" ; pwd -P )"
cd /usr/share/seamonkey &&

# install igt5
if [ ! -d igt5 ]; then
    git clone https://github.com/ve5li/igt5 || exit 1
fi

# install qtc8
if [ ! -d qtc8 ]; then
    git clone https://github.com/ve5li/qtc8 || exit 1
fi

# install h0vs
if [ ! -d h0vs ]; then
    git clone https://github.com/ve5li/h0vs &&
    sudo cp "$script_path/cipher" /usr/bin/cipher &&
    sudo chmod +x /usr/bin/cipher || exit 1
fi

# install ktl9
if [ ! -d ktl9 ]; then
    git clone https://github.com/ve5li/ktl9 &&
    sudo cp "$script_path/doofenshmirtz" /usr/bin/doofenshmirtz &&
    sudo chmod +x /usr/bin/doofenshmirtz || exit 1
fi

# install jts3
if [ ! -d jts3 ]; then
    git clone https://github.com/ve5li/jts3 &&
    sudo cp "$script_path/entleman" /usr/bin/entleman &&
    sudo chmod +x /usr/bin/entleman || exit 1
fi

# install rust if its missing
if [ ! -f /usr/bin/cargo ]; then
    echo "cargo was not found on your system. running rustup..."
    echo "please remember that seamonkey requires the nightly toolchain to compile"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# compile igt5
if [ ! -f /usr/bin/seamonkey ]; then
    cd igt5 && cargo build &&
    sudo cp target/debug/igt5 /usr/bin/seamonkey || exit 1
fi