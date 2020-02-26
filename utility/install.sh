#!/bin/bash

# create seamonkey directory if its missing
if [ ! -d /usr/share/seamonkey ]; then
    sudo mkdir /usr/share/seamonkey &&
    sudo chown "$USER" /usr/share/seamonkey
fi

# get path to untility folder
script_path="$( cd "$(dirname "$0")" ; pwd -P )"
cd /usr/share/seamonkey &&

# install igt5
if [ ! -d igt5 ]; then
    git clone https://github.com/ve5li/igt5 &&
    echo -e "\nigt5 installed successfully\n"
fi

# install qtc8
if [ ! -d qtc8 ]; then
    git clone https://github.com/ve5li/qtc8 &&
    echo -e "\nqtc8 installed successfully\n"
fi

# install h0vs
if [ ! -d h0vs ]; then
    git clone https://github.com/ve5li/h0vs &&
    sudo cp "$script_path/cipher" /usr/bin/cipher &&
    sudo chmod +x /usr/bin/cipher &&
    echo -e "\nh0vs installed successfully\n"
fi

# install ktl9
if [ ! -d ktl9 ]; then
    git clone https://github.com/ve5li/ktl9 &&
    sudo cp "$script_path/doofenshmirtz" /usr/bin/doofenshmirtz &&
    sudo chmod +x /usr/bin/doofenshmirtz &&
    echo -e "\nktl9 installed successfully\n"
fi

# install jts3
if [ ! -d jts3 ]; then
    git clone https://github.com/ve5li/jts3 &&
    sudo cp "$script_path/entleman" /usr/bin/entleman &&
    sudo chmod +x /usr/bin/entleman &&
    echo -e "\njts3 installed successfully\n"
fi

# install rust if its missing
if [ ! -f /usr/bin/cargo ]; then
    echo -e "\ncargo was not found on your system. running rustup..."
    echo -e "please remember that seamonkey requires the nightly toolchain to compile\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# compile igt5
if [ ! -f /usr/bin/seamonkey ]; then
    cd igt5 && cargo build &&
    sudo cp target/debug/igt5 /usr/bin/seamonkey
    echo -e "\nigt5 compiled successfully\n"
fi

# return to original working directory
cd "$script_path"