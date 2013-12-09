#!/bin/bash
REL=$(lsb_release -a 2>/dev/null | grep Codename | awk '{ print $2}')
clear
sleep 2
echo "Setting up packages for Ubuntu $REL"
sleep 4
sudo dpkg --add-architecture i386 2>/dev/null
rm partners.list
sudo echo "deb http://archive.canonical.com/ubuntu $REL partner" >> partners.list
sudo echo "deb-src http://archive.canonical.com/ubuntu $REL partner" >> partners.list
sudo mkdir -p /etc/apt/sources.list.d
sudo cp partners.list /etc/apt/sources.list.d/

#sudo apt-get update

clear
sleep 2
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
echo "PDF Reader"
echo "Cheese"
echo "Archive Manager"
echo "Gparted"
echo "Compression tools"



sleep 7

sudo apt-get install default-jre flashplugin-installer chromium-browser \
gnome-mplayer comix qbittorrent gnome-terminal docky skype \
ffmpeg cheese evince file-roller zip \
unzip rar unrar lzma gparted 

clear
sleep 3
echo "I think we're done here :)"
sleep 4
echo "Thanks to rbheromax..."
sleep 2
echo "...and tvillerealest"
echo "#teamclosure"
