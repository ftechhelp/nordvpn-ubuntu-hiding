#!/bin/bash

#Install dependencies

sudo apt-get update
sudo apt-get upgrade

#NordVPN
sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)
sudo nordvpn login
#net-tools
sudo apt-get install net-tools
#macchanger
sudo apt-get install macchanger
#cron
sudo apt-get install cron

#Install hide and unhide commands on local enviroment
install_path=${1:-"/usr/local/bin/SystemScripts"}
sudo mkdir $install_path
sudo chmod 777 $install_path
sudo cp hiding.sh $install_path
sudo chmod 777 "$install_path/hiding.sh"

#Add commands dynamically to ~/.bashrc and refresh it
echo "alias hide='sudo bash $install_path/hiding.sh hide'" >> ~/.bashrc
echo "alias unhide='sudo bash $install_path/hiding.sh unhide'" >> ~/.bashrc
. ~/.bashrc

#Create cron job
sudo touch /etc/cron.d/hiding
sudo chmod 644 /etc/cron.d/hiding
sudo chown root:root /etc/cron.d/hiding
sudo service cron restart