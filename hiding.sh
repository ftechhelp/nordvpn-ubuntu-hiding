#!/bin/bash

#USAGE
#h=hide or unhide
#t=Time in minutes to you want the server to change when using command hide (default: 10) **OPTIONAL**
#Syntax: ./hiding.sh h t
#Example: ./hiding.sh hide 30, ./hiding.sh unhide
#or when installed: hide 30, unhide

#Setup random country for hide command
countries=(Greece Portugal Argentina Hong_Kong Romania Australia Hungary Serbia Austria Iceland Singapore Belgium Slovakia United_States Canada)
random_index=$(( ( (RANDOM % 17) - 1 )  + 1 ))
random_country=${countries[$random_index]}

#Get network device that is in use
devices=$(ip addr show | awk '/inet.*brd/{print $NF}')

for device in $devices
do
  active_device=$device
  break
done

#Controls what the hide and unhide commands do
if [ $1 == "hide" ]
then
  sudo ifconfig wlp1s0 down
  sudo macchanger -r $active_device
  sudo ifconfig wlp1s0 up
  sleep 5
  nordvpn set killswitch on
  nordvpn connect $random_country
  echo "*/${2:-10} * * * * root nordvpn connect $random_country" > /etc/cron.d/hiding
  sudo systemctl restart cron
elif [ $1 == "unhide" ]
then
  nordvpn set killswitch off
  nordvpn disconnect 
  echo "" > /etc/cron.d/hiding
  sudo systemctl restart cron
  sudo ifconfig wlp1s0 down
  sudo macchanger -r wlp1s0
  sudo ifconfig wlp1s0 up
  sudo systemctl restart cron
else
  sudo ifconfig wlp1s0 down
  sudo macchanger -r $active_device
  sudo ifconfig wlp1s0 up
  sleep 5
  nordvpn set killswitch on
  nordvpn connect $random_country
  echo "*/${2:-10} * * * * root nordvpn connect $random_country" > /etc/cron.d/hiding
  sudo systemctl restart cron
fi