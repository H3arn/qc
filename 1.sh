#!/bin/bash
echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf.d/01norecommend
echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/01norecommend
apt update

apt install xserver-xorg-core xserver-xorg-input-all xinit openbox dbus-x11

apt install keepassxc pcscd scdaemon gnupg pinentry-qt lxterminal

mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
echo "disable-ccid" > ~/.gnupg/scdaemon.conf


cat <<EOF > ~/.xinitrc
#!/bin/sh
# 1. Merge X resources (Optional styling for xterm)
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
# 3. Initialize the GPG Agent
# Ensures the agent is running and ready to handle smartcard requests.
eval $(gpg-agent --daemon)
# 4. Start the Window Manager
# using 'exec' ensures that when Openbox exits, the X server shuts down.
exec openbox-session
EOF

mkdir -p ~/.config/openbox
echo "keepassxc &" > ~/.config/openbox/autostart

