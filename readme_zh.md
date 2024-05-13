

# 目录

\- [English](readme_en.md)

\- [中文](readme_zh.md)

# PPPwn orangepi

这个脚本是基于orangepi5 **debian**系统运行PPPwn漏洞，达到自动破解的效果。其他系统应该要调整一下开机启动脚本。

# 测试设备

- Orangepi 5 （debian）
- nanopi neo2  (armbian)
- 理论适用于aarch64架构的所有设备 (debian)

# 准备工作

在自动破解之前，如果是第一次破解，你应该将支持PS4系统版本的**GOLDHEN.bin**文件放置在**exfat**的**U盘根目录**中，插入PS4的USB接口。此后不需要这步操作。

```sh
sudo apt update
sudo apt install git -y
cd /root/
git clone https://github.com/LYU4662/PPPwn_orangepi.git
cd PPPwn_orangepi/
sudo chmod 777 *
sudo bash setup.sh
```

然后修改run.sh内的一些定义 `vim run.sh`，例如使用的网口、系统版本、破解完成后是否自动关机等。使用`i` 进入编辑模式，编辑完成后使用`esc`退出编辑模式，输入 `:wq`保存。

```sh
INTERFACE="end0" #可以通过ip a查看网卡接口
FIRMWAREVERSION="11.00"
SHUTDOWN=true
```

# 运行测试

完成上述操作后 `sudo bash run.sh` 进行测试。如果出现以下则代表可以正常运行，此时已经可以运行破解程序。

```sh
root@nanopineo2:~/PPPwn_orangepi# ./run.sh
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

