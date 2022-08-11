# macOS on Hyper-V
This repository aims to provide support for macOS on Hyper-V

## Current State:

OpenCore Bootloader boots in Hyper-V and will now boot macOS Big Sur Installer. 

- [X] ~~Getting OpenCore Bootloader to boot in Hyper-V~~
- [X] ~~Get OpenCore/Hyper-V to correctly detect different macOS installers regardless of location or type (online/offline)~~
- [X] ~~Opencore boot of macOS installer and begin to load macOS kernel~~
- [X] ~~Successfully load any macOS installer version begin to install macOS to Hyper-V~~
- [ ] Install and run macOS 10.4 - 10.6 in 32bit mode
- [ ] Install and run macOS 10.7 - 10.12
- [X] Install and run macOS 10.13
- [X] Install and run macOS 10.14
- [X] Install and run macOS 10.15
- [X] Install and run macOS 11
- [ ] Install and run macOS 12
- [X] Successfully load any macOS version to desktop on Hyper-V
- [X] ~~Keyboard Support~~
- [X] ~~Trackpad Support~~
- [X] ~~Touchscreen Support~~
- [ ] Audio Support
- [ ] Power Management Support
- [ ] Graphics Acceleration Support

## *** NOTICE ***
### Guide and support files will be posted as soon as I can squish a few more bugs.
### This is currently at an Alpha stage but is usable. You must create a Gen2 virtual machine in Hyper-V with a virtual drive. Once created you must partition with a minimum of 2 partitions, 1 of which is your EFI partition. You can copy the EFI folder to the EFI partition. You will need to create an installer drive in order to install macOS on your new VM. Follow the directions [here](https://github.com/acidanthera/MacHyperVSupport) to create your installer.

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

### [Chapter 1) Quick Start Install]
### [Chapter 2) Quirks & Fixes]
### [Chapter 3) Additional Drivers]




## What works 

- OpenCore Bootloader
- Trackpad
- TouchScreen / Stylus (Hyper-v passes as mouse input)
- macOS 10.13-11



## What doesn't work

- Graphic Acceleration including 4K support.
- Audio
- Brightness Adjustment
- Power Management
- Sleep / Wake
- Thunderbolt
- Fingerprint Sensor
- SDcard
- USB
- Battery
- Recovery
- FileVault
- Bluetooth
- Brightness Keys





### Credits

Thanks to [@acidanthera](https://github.com/acidanthera) for creating the software, kexts, and patches, required to even begin to make this possible. I take no credit for any of this development and only seek to make an easy to use method for getting macOS running on Hyper-V. You can find original sources at the following links: [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg) & [Hyper-V Support](https://github.com/acidanthera/MacHyperVSupport). 
