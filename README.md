# macOS Hackintosh on Hyper-V
This repository aims to provide support for macOS on Hyper-V

## Current State:

OpenCore Bootloader boots in Hyper-V and will now boot macOS Installers. 

- [ ] Install and run macOS 10.4 - 10.6 in 32bit mode
- [ ] Install and run macOS 10.7 - 10.12
- [ ] Install and run macOS 10.13
- [ ] Install and run macOS 10.14
- [X] ~~Install and run macOS 10.15~~
- [X] ~~Install and run macOS 11~~
- [X] ~~Install and run macOS 12~~
- [X] ~~Install and run macOS 13~~
- [X] ~~Install and run macOS 14 Beta~~
- [X] ~~Keyboard Support~~
- [X] ~~Trackpad Support~~
- [X] ~~Touchscreen Support~~
- [ ] Audio Support
- [ ] Power Management Support
- [ ] Graphics Acceleration Support

## *** NOTICE ***
### This is currently at Beta stage but is usable. 
### Please pay special attention to the installation instructions linked below.

## Hyper-V Recommended Settings:

| Model: | Minimum | Optimal |
|---|----------|----------|
|CPU| 2 virtual cores | 4+ virtual cores |
|GPU| 128 mb graphics ram | 1+ gb graphics ram |
|RAM| 2 gb | 8+ gb |
|SSD| 30 gb | 60+ gb |
|WiFi| Default Switch | Default Switch |
|Batt| N/A | N/A |
|USB| N/A | N/A |




## Instruction Guides

### [Chapter 1) Installation Guide](https://github.com/balopez83/macOS_On_Hyper-V/blob/main/1-QuickStart.md)
### [Chapter 2) Quirks & Fixes](https://github.com/balopez83/macOS_On_Hyper-V/blob/main/Quirks%26Fixes.md)





## What works 

- OpenCore Bootloader
- Trackpad
- TouchScreen / Stylus (Hyper-v passes as mouse input)
- Keyboard
- macOS Installer
- macOS Recovery
- macOS Web Recovery
- Hyper-V Time Sync (with utility)
- Hyper-V File Sync (with utility)
- Hyper-V Heartbeat (with utility)
- VESA graphics limited to 1024x768 resolution (non-accelerated)



## What doesn't work

- Graphic Acceleration
- Resolution adjustment (limited to 1024x768 only)
- Audio
- Power Management
- Sleep / Wake
- SDcard
- USB passthrough
- FileVault (Untested)
- Bluetooth passthrough






### Credits

Thanks to [@acidanthera](https://github.com/acidanthera) for creating the software, kexts, and patches, required to even begin to make this possible. I take no credit for any of this development and only seek to make an easy to use method for getting macOS running on Hyper-V. You can find original sources at the following links: [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg) & [Hyper-V Support](https://github.com/acidanthera/MacHyperVSupport). 
