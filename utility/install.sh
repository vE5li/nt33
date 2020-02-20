#!/bin/bash

# make sure that seamonkey is not already installed

# install rust if its missing

# create directory
script_path="$( cd "$(dirname "$0")" ; pwd -P )"
sudo mkdir /usr/share/seamonkey
sudo chown "$USER" /usr/share/seamonkey
cd /usr/share/seamonkey

# install igt5
git clone https://github.com/ve5li/igt5
cd igt5
cargo build
sudo cp target/debug/igt5 /usr/bin/seamonkey
cd ..

# install qtc8
git clone https://github.com/ve5li/qtc8

# install h0vs
git clone https://github.com/ve5li/h0vs
sudo cp "$script_path/cipher" /usr/bin/cipher
sudo chmod +x /usr/bin/cipher

# install ktl9
git clone https://github.com/ve5li/ktl9
sudo cp "$script_path/doofenshmirtz" /usr/bin/doofenshmirtz
sudo chmod +x /usr/bin/doofenshmirtz

# install jts3
git clone https://github.com/ve5li/jts3
sudo cp "$script_path/entleman" /usr/bin/entleman
sudo chmod +x /usr/bin/entleman
