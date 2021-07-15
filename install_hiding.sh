#!/bin/bash

#TODO (Install Script)
#-Install dependencies (nordvpn, net-tools, macchanger, cron) [ X ]
#-Add commands dynamically to ~/.bashrc and refresh it (. ~/.bashrc) [ X ]
#-Copy hiding.sh to specified path with parameter or default to /tmp/SystemScripts [ X ]
#-Copy cronjob to /etc/cron.d/hiding [  ]

#Install dependencies

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
install_path=${1:-"/tmp/SystemScripts"}
sudo mkdir /tmp/SystemScripts
sudo chmod 777 /tmp/SystemScripts
sudo cp hiding.sh $install_path
sudo chmod 777 $install_path

#Add commands dynamically to ~/.bashrc and refresh it
echo "alias hide='sudo bash /tmp/SystemScripts/hiding.sh hide'" >> ~/.bashrc
echo "alias unhide='sudo bash /tmp/SystemScripts/hiding.sh unhide'" >> ~/.bashrc
. ~/.bashrc
