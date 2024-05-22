# Directory

\- [English](readme_en.md)

\- [中文](readme.md)

# Changelog

- 20240513 Newly created repositories support ARCH 64 devices by default
- 20240514 Added support for x86 and cortex-a7 architectures, thanks again to xfangfang/PPPwn_cpp
- 20240522 Added 10.00 10.01 goldehen support, modified 9.0 11.00 10.00 10.01 stage2.bin to support GoldHEN_v2.4b17.2 Thanks **sistr0**.To update the PPPwn_cpp process synchronously, please refer to `https://github.com/xfangfang/PPPwn_cpp.git` for the PPPwn_cpp update section.

# PPPwn orangepi

This script was initially tested on the orangepi5 **debian** system running PPPwn vulnerability, and the effect of automatic cracking was achieved. Now it supports x86, aarch64, armv7 architecture chips, and other systems should adjust the boot script.

# Test equipment

- JDC AX1800pro (openwrt) only runs the test, does not test the automatic shutdown and boot automatic cracking, if the prompt `sudo: not found` is prompted, please delete the `sudo` character in the `run.sh`
- Orangepi 5 (debian)
- nanopi neo2  (armbian)
- Works with all devices based on aarch64 architecture (Debian/Armbian)
- Works on all devices with x86_64 architectures (Debian/Armbian)
- Compatible with all devices with ARMv7 (Cortex-A7) architecture (Debian/Armbian) 

# Preparation

Before the automatic cracking, if it is the first crack, you should place the **GOLDHEN.bin** file that supports the PS4 system version in the **USB flash drive root directory** of **exfat**, and insert it into the USB port of PS4. This step is not required after that.

```sh
sudo apt update
sudo apt install git -y
cd /root/
git clone https://github.com/LYU4662/PPPwn_orangepi.git
cd PPPwn_orangepi/
sudo chmod 777 *
sudo bash setup.sh
```

Then modify some definitions of `vim run.sh` in the run.sh, such as the network port used, the system version, whether it will automatically shut down after the cracking is completed, etc. Use `i` to enter editing mode, use `esc`to exit editing mode after editing, and enter `:wq` to save.

```sh
INTERFACE="end0" #You can view the interface through (ip a)
FIRMWAREVERSION="11.00"
SHUTDOWN=true
```

# Run the test

Once you've done the above,`sudo bash run.sh` to test. If the following appears, it means that it can run normally, and the cracked program can be run at this time.

```sh
root@nanopineo2:~/PPPwn_orangepi# sudo bash run.sh
 _____ _____ _____                                          _
|  _  |  _  |  _  |_ _ _ ___    ___ ___ ___ ___ ___ ___ ___|_|
|   __|   __|   __| | | |   |  | . |  _| .'|   | . | -_| . | |
|__|  |__|  |__|  |_____|_|_|  |___|_| |__,|_|_|_  |___|  _|_|
                                               |___|   |_|
https://github.com/LYU4662/PPPwn_orangepi.git
Thanks to https://github.com/xfangfang/PPPwn_cpp.git
         https://github.com/TheOfficialFloW/PPPwn.git
         https://github.com/stooged/PI-Pwn.git
         https://github.com/PSGO/PPPwnGo.git

Ready for console connection
Firmware: 11.00
Interface: end0
```

