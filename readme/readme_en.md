# Directory

\- [English](readme/readme_en.md)

\- [中文](readme/readme_zh.md)

# PPPwn orangepi

This script is based on the PPPwn vulnerability running on the orangepi5 **debian** system, and the effect of automatic cracking is achieved. Other systems should need to adjust the boot script.

# Test equipment

- Orangepi 5 （debian）
- nanopi neo2  (armbian)
- Theory applies to all devices of the aarch64 architecture (debian)

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

