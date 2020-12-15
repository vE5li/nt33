#!/bin/bash

# create tortoise directory if its missing
if [ ! -d /usr/share/tortoise ]; then
    sudo mkdir /usr/share/tortoise &&
    sudo chown "$USER" /usr/share/tortoise
fi

# get path to untility folder
script_path="$( cd "$(dirname "$0")" ; pwd -P )"
cd /usr/share/tortoise &&
echo -e "\n"

# install seamonkey
if [ ! -d seamonkey ]; then
    git clone https://github.com/ve5li/seamonkey &&
    echo -e "\nseamonkey installed successfully\n"
fi

# install seashell
if [ ! -d seashell ]; then
    git clone https://github.com/ve5li/seashell &&
    echo -e "\nseashell installed successfully\n"
fi

# install shego
if [ ! -d shego ]; then
    git clone https://github.com/ve5li/shego &&
    echo -e "\nshego installed successfully\n"
fi

# install cipher
if [ ! -d cipher ]; then
    git clone https://github.com/ve5li/cipher &&
    sudo cp "$script_path/cipher" /usr/bin/cipher &&
    sudo chmod +x /usr/bin/cipher &&
    echo -e "\ncipher installed successfully\n"
fi

# install doofenshmirtz
if [ ! -d doofenshmirtz ]; then
    git clone https://github.com/ve5li/doofenshmirtz &&
    sudo cp "$script_path/doofenshmirtz" /usr/bin/doofenshmirtz &&
    sudo chmod +x /usr/bin/doofenshmirtz &&
    echo -e "\ndoofenshmirtz installed successfully\n"
fi

# install entleman
if [ ! -d entleman ]; then
    git clone https://github.com/ve5li/entleman &&
    sudo cp "$script_path/entleman" /usr/bin/entleman &&
    sudo chmod +x /usr/bin/entleman &&
    echo -e "\nentleman installed successfully\n"
fi

# install rust if its missing
if [ ! -d "$HOME/.cargo" ]; then
    echo -e "\ncargo was not found on your system. running rustup..."
    echo -e "please remember that seashell requires the nightly toolchain to compile\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
    source "$HOME/.cargo/env" &&
    echo -e "\ncargo installed successfully\n"
fi

# compile seashell
if [ ! -f /usr/bin/seashell ]; then
    cd seashell && cargo build &&
    sudo cp target/debug/seashell /usr/bin/seashell
    echo -e "\nseashell compiled successfully\n"
fi

# return to original working directory
cd "$script_path"
