#!/bin/bash
# This script should be executed as root
echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf.d/01norecommend
echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/01norecommend
apt update

# GnuPG and dm-crypt
apt install gnupg cryptsetup pcscd scdaemon 
# Fish makes prompt easier, though kind of heavy (~40MB)
apt install fish

# GUI
apt install xserver-xorg-core xserver-xorg-input-all xinit openbox dbus-x11 keepassxc pinentry-qt lxterminal
