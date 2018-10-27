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
sudo apt-get install p7zip-full
#4. install Python-Pip
sudo apt-get install -y python3-pip
pip install --upgrade pip
sudo apt-get install -y python3-tk
sudo get-apt install -y python3-venv
sudo apt-get install -y python3-yaml
sudo apt-get install -y python3-dev

#5. install Docker
sudo apt-get install curl
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

#First, disable docker in the template with sudo systemctl disable docker
#Second, add a line in /rw/config/rc.local from you Appvm : dockerd --data-root /home/user/docker
#With that docker will start as daemon with precise indication where to store the images.
#It's easier, efficient and it's the way to go i think in place of modifying a template.

# I can't apply that way, so I coppy debian templateVM to a new alone templateVM and install Docker there