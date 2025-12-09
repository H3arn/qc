#!/bin/bash

# This script should be executed as NON-ROOT user

passwd

# GnuPG config
#mkdir -p ~/.gnupg
#chmod 700 ~/.gnupg
# echo "# disable-ccid" > ~/.gnupg/scdaemon.conf

# X wm config
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
# preserve keepassxc autostart
mkdir -p ~/.config/openbox
echo "keepassxc &" > ~/.config/openbox/autostart
echo "lxterminal &" >> ~/.config/openbox/autostart
