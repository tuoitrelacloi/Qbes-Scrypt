#!/usr/bin/env bash
# 1. First of all, create a new fedora-27-template-minimal from dom0
#[user@dom0 ~]$
sudo qubes-dom0-update qubes-template-fedora-27-minimal

# 2. Copy to a new template to install program
# [user@dom0 ~]$
qvm-clone fedora-27-minimal your-new-clone

# Qubes 4.0
# In Qubes R4.0 the minimal template is not configured for passwordless root.
# To update or install packages to it, from a dom0 terminal window:
#[user@dom0 ~]$
qvm-run -u root fedora-27-minimal xterm
# it will run xterminal in root user, from xterm root user run
dnf install qubes-core-agent-passwordless-root polkit
#to open a root terminal in the template, from which you can use dnf without sudo.
# You will have to do this every time if you choose not to enable passwordless root.


#    qubes-core-agent-qrexec:       Qubes qrexec agent. Installed by default.
#    qubes-core-agent-systemd:      Qubes unit files for SystemD init style. Installed by default.

#    qubes-core-agent-passwordless-root, polkit: By default the ‘fedora-27-minimal’ template doesn’t have passwordless root. These two packages enable this feature. (Note from R4.0 a design choice was made that passwordless should be optional, so is left out of the minimal templates)
#    qubes-core-agent-nautilus: This package provides integration with the Nautilus file manager (without it things like “copy to VM/open in disposable VM” will not be shown in Nautilus).
#    qubes-core-agent-sysvinit: Qubes unit files for SysV init style or upstart.
#    qubes-core-agent-networking: Networking support. Required for general network access and particularly if the template is to be used for a sys-net or sys-firewall VM.
#    qubes-core-agent-network-manager: Integration for NetworkManager. Useful if the template is to be used for a sys-net VM.
#    network-manager-applet: Useful (together with dejavu-sans-fonts and notification-daemon) to have a system tray icon if the template is to be used for a sys-net VM.
#    qubes-core-agent-dom0-updates: Script required to handle dom0 updates. Any template which the VM responsible for ‘dom0’ updates (e.g. sys-firewall) is based on must contain this package.
#    qubes-usb-proxy: Required if the template is to be used for a USB qube (sys-usb) or for any destination qube to which USB devices are to be attached (e.g sys-net if using USB network adapter).
#    pulseaudio-qubes: Needed to have audio on the template VM.


# 3. Start new-clone and run in it's terminal
# Standard tools installation

# FOR ProxyVM/NetworkVM for 3G Modems
# [user@your-new-clone ~]$
sudo dnf install qubes-core-agent-networking qubes-usb-proxy ModemManager NetworkManager-wwan usb_modeswitch modem-manager-gui
