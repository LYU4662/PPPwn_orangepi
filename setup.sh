#!/bin/bash
sudo apt update
sudo apt install vim -y
sudo chmod +x /root/PPPwn_orangepi/run.sh
sudo chmod +x /root/PPPwn_orangepi/pppwn
sudo chmod 777 /root/PPPwn_orangepi/rc.local
cp -rf /root/PPPwn_orangepi/rc.local /etc/rc.local
