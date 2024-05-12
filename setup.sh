#!/bin/bash
#sudo apt update
sudo grep -v 'sudo bash /boot/firmware/PPPwn/run.sh &' /etc/rc.local > temp && sudo mv temp /etc/rc.local
sudo chmod +x /root/PPPwn_orangepi/run.sh
sudo chmod +x /root/PPPwn_orangepi/pppwn
