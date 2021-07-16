# nordvpn-ubuntu-hiding
Become anonymous on Ubuntu with NordVPN and other technologies with one simple command.

# INSTALL
- Clone Repo `git clone https://github.com/ftechhelp/nordvpn-ubuntu-hiding.git`
- Run install_hiding.sh `./install_hiding.sh`
- After the install script installs dependencies, it will ask you to login to your NordVPN account
- Open a new terminal and run the command `hide` to hide and `unhide` to revert changes

# What happens when I run the command `hide`?
- Changes the mac address of your active network device
- Sets NordVPN's killswitch feature on (stops you from accessing the internet if you are not connected to a VPN)
- Connects you to a random country within the list below with NordVPN
- Sets a cron job to connect you to a different random country (within the list) every 10 minutes by default (You can change that by supplying a number in minutes as parameter Ex: `hide 30` to switch servers every 30 minutes)

# What happens when I run the command `unhide`?
- Changes the mac address of your active network device
- Sets NordVPN's killswitch feature off
- Disconnects you from NordVPN
- Disables the cron job

# USAGE
h=hide or unhide\
t=Time in minutes to you want the server to change when using command hide (default: 10) *OPTIONAL*\
Syntax: ./hiding.sh h t\
Example: ./hiding.sh hide 30, ./hiding.sh unhide\
or when installed: hide 30, unhide

# List of countries
- Greece 
- Portugal 
- Argentina 
- Hong_Kong 
- Romania 
- Australia
- Hungary
- Serbia 
- Austria
- Iceland 
- Singapore 
- Belgium 
- Slovakia 
- United_States 
- Canada
