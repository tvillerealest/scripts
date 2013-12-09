#!/bin/bash
REL=$(lsb_release -a 2>/dev/null | grep Codename | awk '{ print $2}')
echo "Setting up packages for Ubuntu $REL"
sleep 4
sudo dpkg --add-architecture i386 2>/dev/null
rm partners.list
sudo echo "deb http://archive.canonical.com/ubuntu $REL partner" >> partners.list
sudo echo "deb http://archive.canonical.com/ubuntu $REL partner" >> partners.list
sudo mkdir -p /etc/apt/sources.list.d
sudo cp partners.list /etc/apt/sources.list.d/
sudo apt-get update

clear
echo "Installing these apps:"
echo ""
echo "Java JRE"
echo "Flash player plugin"
echo "Chromium web browser"
echo "Mplayer"
echo "Comix"
echo "Qbittorrent"
echo "Docky"
echo "Skype"

sleep 4

sudo apt-get install default-jre flashplugin-installer chromium-browser \
gnome-mplayer comix qbittorrent gnome-terminal docky skype

clear
echo "I think we're done here :)"
sleep 5
echo "Thanks to rbheromax..."
sleep 2
echo "...and tvillerealest"
echo "#teamclosure"
