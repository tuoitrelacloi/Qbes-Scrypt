#!/bin/sh
#Run in Debian TemplateVM
# ---------------------------------------------------------------------
# Debian getting startup script.
# ---------------------------------------------------------------------
#0. update system
sudo apt-get update && sudo apt-get upgrade

# I don't know why debian was not pre-installed file manager, so I install nautilus
sudo apt-get install -y nautilus

#2. install Atom
wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb
sudo apt --fix-broken install

#3. install vlc
sudo apt-get install -y vlc

#4. install Python-Pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-tk
sudo get-apt install -y python3-venv
sudo apt-get install -y python3-yaml
sudo apt-get install -y python3-dev
sudo apt-get install -y python-yaml

#5. install Docker
sudo apt-get install curl
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

