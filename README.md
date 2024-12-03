# macOS Hackintosh on Hyper-V
This repository aims to provide support for macOS on Hyper-V

## Archived as I no longer have a device capable of testing Hyper-V nor do I have the time to properly maintain this project. @Qonfused at https://github.com/Qonfused/OSX-Hyper-V has a project that supports autobuilding and is more actively maintained. I recommend using that project instead.

----------------------


## WARNING: Intel "i" series CPU's ONLY are currently supported. Xeon, Pentium, Celeron and AMD CPU's are not yet supported by the Hyper-V drivers developed by Acidanthera.


![Ventura-Hyper-V](https://github.com/balopez83/macOS_On_Hyper-V/assets/53441362/5411a4cf-0172-4b1b-9806-95266024d6a7)


## Current State Of Support:

- Mac OS X 10.0 - 10.3 are PowerPC based and cannot be installed
- [ ] macOS 10.4 Tiger (End of Life)
- [ ] macOS 10.5 Leopard (End of Life)
- [ ] macOS 10.6 Snow Leopard (End of Life)
- [ ] macOS 10.7 Lion (End of Life)
- [X] macOS 10.8 Mountain Lion (End of Life)
- [X] macOS 10.9 Mavericks (End of Life)
- [X] macOS 10.10 Yosemite (End of Life)
- [X] macOS 10.11 El Capitan (End of Life)
- [X] macOS 10.12 Sierra (End of Life)
- [X] macOS 10.13 High Sierra (End of Life)
- [X] macOS 10.14 Mojave (End of Life)
- [X] macOS 10.15 Catalina (End of Life)
- [X] macOS 11 Big Sur (Est End of Life Nov 2023)
- [X] macOS 12 Monterey
- [X] macOS 13 Ventura
- [X] macOS 14 Sonoma
- [ ] macOS 15 
- [ ] Audio Support
- [ ] Power Management Support
- [ ] Graphics Acceleration Support
- [x] Battery Information Passthrough
- [ ] AMD Not Yet Supported

## *** NOTICE ***
### This is currently at Beta stage but is usable. 
### Please pay special attention to the installation instructions linked below.

## Hyper-V Recommended Settings:

| Model: | Minimum | Optimal |
|---|----------|----------|
|CPU| 2 virtual cores | 4+ virtual cores |
|GPU| 128 mb graphics ram | 1+ gb graphics ram |
|RAM| 4 gb (10.15 & Older) 8 gb (11+) | 8+ gb |
|SSD| 30 gb | 60+ gb |
|WiFi| Default Switch | Default Switch |
|Batt| N/A | N/A |
|USB| N/A | N/A |




## Instruction Guides

### [Chapter 1) Installation Guide](https://github.com/balopez83/macOS_On_Hyper-V/blob/main/1-QuickStart.md)
### [Chapter 2) Quirks & Fixes](https://github.com/balopez83/macOS_On_Hyper-V/blob/main/Quirks%26Fixes.md)





## What works 

- [x] OpenCore Bootloader
- [x] Trackpad
- [x] TouchScreen / Stylus (Hyper-v passes as mouse input)
- [x] Keyboard
- [x] macOS Installer
- [x] macOS Recovery
- [x] macOS Web Recovery
- [x] Hyper-V Time Sync (with utility)
- [x] Hyper-V File Sync (with utility)
- [x] Hyper-V Heartbeat (with utility)
- [x] VESA graphics limited to 1024x768 resolution (non-accelerated)
- [x] Battery Information Passthrough when macOS on Hyper-V is run on laptops



## What doesn't work

- [ ] Graphic Acceleration
- [ ] Resolution adjustment (limited to 1024x768 only)
- [ ] Audio
- [ ] Power Management
- [ ] Sleep / Wake
- [ ] SDcard
- [ ] USB passthrough
- [ ] FileVault (Untested)
- [ ] Bluetooth passthrough
- [ ] AMD Not Supported yet


### Credits

Thanks to [@acidanthera](https://github.com/acidanthera) for creating the software, kexts, and patches, required to even begin to make this possible. I take no credit for any of this development and only seek to make an easy to use method for getting macOS running on Hyper-V. You can find original sources at the following links: [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg) & [Hyper-V Support](https://github.com/acidanthera/MacHyperVSupport).
