#!/bin/bash
## ROOT
## if script not running. Install "dos2unix"

## Create USER
adduser fm

## Create Password user
# echo Lalapo123 | passwd fm --stdin
echo 'fm:Lalapo123' | chpasswd

## add to group sudoers
usermod -aG wheel fm

## Install epel tools
yum install epel-release -y

## Install GUI server tools
yum groupinstall "Server with GUI" -y

## Install GUI XFCE
yum groupinstall "Xfce" -y

## SET Deafault GUI
systemctl set-default graphical.target
# *OUTPUT: Removed symlink /etc/systemd/system/default.target.
# *OUTPUT: Created symlink from /etc/systemd/system/default.target to /usr/lib/systemd/system/graphical.target.

systemctl get-default
# *OUTPUT: graphical.target


## If error SET GUI uncomment this and try again : systemctl set-default graphical.target && systemctl get-default
#systemctl isolate graphical.target

## Install X RDP for connect from RDP Remote
yum -y install xrdp
systemctl enable xrdp
systemctl start xrdp

# Kalo error akses
firewall-cmd --permanent --add-port=3389/tcp 
firewall-cmd --reload

## Install Chrome Browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install ./google-chrome-stable_current_*.rpm -y

## Switch to New USER
su - fm

#echo "exec /usr/bin/xfce4-session" >> ~/.xinitrc
#startx 

echo "xfce4-session" > ~/.Xclients
chmod a+x ~/.Xclients