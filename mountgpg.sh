#!/bin/bash
# save this to ~/mountgpg.sh
cryptsetup open /dev/disk/by-label/gpg gpg
mount /dev/mapper/gpg /media/user/gpg
