#!/usr/bin/env bash

# I don't know that had already fedora-28 available, that's great, now i just want to install 3G USB to become a NET VM
# First, update fedora 28 from dom0
sudo qubes-dom0-update qubes-template-fedora-28

# run it and from terminal inside

sudo dnf update && sudo dnf upgrade
