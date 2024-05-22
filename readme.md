

# 目录

\- [English](readme_en.md)

\- [中文](readme.md)

# 更新日志
- 20240513 新创建仓库 默认支持aarch64架构设备
- 20240514 增加x86、cortex-a7架构支持  再次感谢xfangfang/PPPwn_cpp
- 20240522 增加10.00 10.01 goldehen支持，修改9.0 11.00 10.00 10.01的stage2.bin 用以支持GoldHEN_v2.4b17.2 感谢**sistr0** 。同步更新PPPwn_cpp程序，PPPwn_cpp更新部分请参考`https://github.com/xfangfang/PPPwn_cpp.git`

# PPPwn orangepi
这个脚本初始测试于orangepi5 **debian**系统运行PPPwn漏洞，达到自动破解的效果。现支持x86、aarch64、armv7架构芯片, 其他系统应该要调整一下开机启动脚本。

# 测试设备
- JDC AX1800pro (openwrt) 仅进行运行测试，未测试自动关机及开机自动破解，如提示`sudo: not found` 请删除`run.sh`内的`sudo`字符
- Orangepi 5 （debian）
- nanopi neo2  (armbian)
- 适用于aarch64架构的所有设备 (debian/armbian)
- 适用于x86_64架构的所有设备 (debian/armbian)
- 适用于armv7(cortex-a7)架构的所有设备 (debian/armbian) 

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

