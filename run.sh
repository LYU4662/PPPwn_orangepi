#!/bin/bash

ARCH=$(uname -m)
INTERFACE="end1" 
FIRMWAREVERSION="11.00" 
SHUTDOWN=true

echo -e "\033[32m _____ _____ _____                                          _ \033[0m"
echo -e "\033[32m|  _  |  _  |  _  |_ _ _ ___    ___ ___ ___ ___ ___ ___ ___|_|\033[0m"
echo -e "\033[32m|   __|   __|   __| | | |   |  | . |  _| .'|   | . | -_| . | |\033[0m"
echo -e "\033[32m|__|  |__|  |__|  |_____|_|_|  |___|_| |__,|_|_|_  |___|  _|_|\033[0m"
echo -e "\033[32m                                               |___|   |_|    \033[0m"

echo -e "\033[34mhttps://github.com/LYU4662/PPPwn_orangepi.git \033[0m"
echo -e "\033[34mThanks to https://github.com/xfangfang/PPPwn_cpp.git \n \t https://github.com/TheOfficialFloW/PPPwn.git \n \t https://github.com/stooged/PI-Pwn.git \n \t https://github.com/PSGO/PPPwnGo.git \033[0m"


if [ $ARCH = "aarch64" ] ; then
	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	echo -e "\n\033[32mReady for console connection\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nInterface:\033[93m $INTERFACE\033[0m\n"
	ret=$(sudo /root/PPPwn_orangepi/pppwn --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage1/stage1.bin" --stage2 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage2/stage2.bin" --auto-retry)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem powroff\033[0m"
		sudo poweroff
	fi

   else	
	echo -e "\033[31m arch is not aarch64, error \033[0m"
fi

