#!/bin/bash

#TODO (Install Script)
#-Install dependencies (nordvpn, net-tools, macchanger, cron) [ X ]
#-Add commands dynamically to ~/.bashrc and refresh it (. ~/.bashrc) [  ]
#-Copy hiding.sh to specified path with parameter or default to ~ [  ]
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