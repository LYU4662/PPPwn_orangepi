#!/bin/bash

ARCH=$(uname -m)
INTERFACE="end0" 
FIRMWAREVERSION="11.00" 
SHUTDOWN=true

echo -e "\033[32m _____ _____ _____                                          _ \033[0m"
echo -e "\033[32m|  _  |  _  |  _  |_ _ _ ___    ___ ___ ___ ___ ___ ___ ___|_|\033[0m"
echo -e "\033[32m|   __|   __|   __| | | |   |  | . |  _| .'|   | . | -_| . | |\033[0m"
echo -e "\033[32m|__|  |__|  |__|  |_____|_|_|  |___|_| |__,|_|_|_  |___|  _|_|\033[0m"
echo -e "\033[32m                                               |___|   |_|    \033[0m"

echo -e "\033[34mhttps://github.com/LYU4662/PPPwn_orangepi.git \033[0m"
echo -e "\033[34mThanks to https://github.com/xfangfang/PPPwn_cpp.git \n \t https://github.com/TheOfficialFloW/PPPwn.git \n \t https://github.com/stooged/PI-Pwn.git \n \t https://github.com/PSGO/PPPwnGo.git  \n \t https://github.com/GoldHEN/GoldHEN/releases \033[0m"



if [ "$ARCH" = "x86_64" ]; then
	echo -e "\033[32mArchitecture is x86_64\033[0m"
	echo -e "\n\033[32mReady for console connection\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nInterface:\033[93m $INTERFACE\033[0m\n"

	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	ret=$(sudo /root/PPPwn_orangepi/PPPwn/pppwn_x86_64 --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage1/stage1.bin" --stage2 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage2/stage2.bin" --timeout 10 --auto-retry)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem poweroff\033[0m"
		sudo poweroff
	fi

elif [[ "$ARCH" == aarch64* ]]; then
	echo -e "\033[32mArchitecture is aarch64 or variant\033[0m"
	echo -e "\n\033[32mReady for console connection\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nInterface:\033[93m $INTERFACE\033[0m\n"

	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	ret=$(sudo /root/PPPwn_orangepi/PPPwn/pppwn_aarch64 --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage1/stage1.bin" --stage2 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage2/stage2.bin" --timeout 10 --auto-retry)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem poweroff\033[0m"
		sudo poweroff
	fi

elif [[ "$ARCH" == armv7* ]]; then
	echo -e "\033[32mArchitecture is armv7 or variant\033[0m"
	echo -e "\n\033[32mReady for console connection\033[92m\nFirmware:\033[93m $FIRMWAREVERSION\033[92m\nInterface:\033[93m $INTERFACE\033[0m\n"

	sudo ip link set $INTERFACE down
	coproc read -t 2 && wait "$!" || true
	sudo ip link set $INTERFACE up

	ret=$(sudo /root/PPPwn_orangepi/PPPwn/pppwn_armv7 --interface "$INTERFACE" --fw "${FIRMWAREVERSION//.}" --stage1 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage1/stage1.bin" --stage2 "/root/PPPwn_orangepi/PS4_stage_bin_all/PS4-$FIRMWAREVERSION/stage2/stage2.bin" --timeout 10 --auto-retry)

	if [ $SHUTDOWN = true ] ; then
		echo -e "\033[32msystem poweroff\033[0m"
		sudo poweroff
	fi

else
    echo "Unknown architecture: $ARCH, error"
fi

