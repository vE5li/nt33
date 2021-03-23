#!/bin/bash
script_path="$( cd "$(dirname "$0")" ; pwd -P )"
cd /usr/share &&
echo -e "\n"

# install seamonkey
#if [ ! -d seamonkey ]; then
    sudo git clone https://github.com/ve5li/seamonkey &&
    sudo chown -R "$USER" seamonkey/
    echo -e "\nseamonkey installed successfully\n"
#fi

# install leafsheep
if [ ! -d leafsheep ]; then
    sudo git clone https://github.com/ve5li/leafsheep &&
    sudo chown -R "$USER" leafsheep/
    echo -e "\nleafsheep installed successfully\n"
fi

# install shego
if [ ! -d shego ]; then
    sudo git clone https://github.com/ve5li/shego &&
    sudo chown -R "$USER" shego/
    echo -e "\nshego installed successfully\n"
fi

# install liquify
if [ ! -d liquify ]; then
    sudo git clone https://github.com/ve5li/liquify &&
    sudo chown -R "$USER" liquify/
    sudo cp "$script_path/liquify" /usr/bin/liquify &&
    sudo chmod +x /usr/bin/liquify &&
    echo -e "\nliquify installed successfully\n"
fi

# install cipher
if [ ! -d cipher ]; then
    sudo git clone https://github.com/ve5li/cipher &&
    sudo chown -R "$USER" cipher/
    sudo cp "$script_path/cipher" /usr/bin/cipher &&
    sudo chmod +x /usr/bin/cipher &&
    echo -e "\ncipher installed successfully\n"
fi

# install doofenshmirtz
if [ ! -d doofenshmirtz ]; then
    sudo git clone https://github.com/ve5li/doofenshmirtz &&
    sudo chown -R "$USER" doofenshmirtz/
    sudo cp "$script_path/doofenshmirtz" /usr/bin/doofenshmirtz &&
    sudo chmod +x /usr/bin/doofenshmirtz &&
    echo -e "\ndoofenshmirtz installed successfully\n"
fi

# install entleman
if [ ! -d entleman ]; then
    sudo git clone https://github.com/ve5li/entleman &&
    sudo chown -R "$USER" entleman/
    sudo cp "$script_path/entleman" /usr/bin/entleman &&
    sudo chmod +x /usr/bin/entleman &&
    echo -e "\nentleman installed successfully\n"
fi

# install rust if its missing
if [ ! -d "$HOME/.cargo" ]; then
    echo -e "\ncargo was not found on your system. running rustup..."
    echo -e "please remember that leafsheep requires the nightly toolchain to compile\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
    source "$HOME/.cargo/env" &&
    echo -e "\ncargo installed successfully\n"
fi

# compile leafsheep
if [ ! -f /usr/bin/leafsheep ]; then
    cd leafsheep && cargo build &&
    sudo cp target/debug/leafsheep /usr/bin/leafsheep
    echo -e "\nleafsheep compiled successfully\n"
fi

# return to original working directory
cd "$script_path"
