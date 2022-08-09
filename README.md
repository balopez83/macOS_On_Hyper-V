# macOS on Hyper-V
This repository aims to provide support for macOS on Hyper-V

## Current State:

OpenCore Bootloader boots in Hyper-V and will now boot macOS Big Sur Installer. 

- [X] Getting OpenCore Bootloader to boot in Hyper-V
- [X] Get OpenCore/Hyper-V to correctly detect different macOS installers regardless of location or type (online/offline)
- [X] Opencore boot of macOS installer and begin to load macOS kernel
- [X] Successfully load any macOS installer version and install macOS to Hyper-V
- [ ] Install and run macOS 10.4 - 10.6 in 32bit mode
- [ ] Install and run macOS 10.7 - 10.12
- [ ] Install and run macOS 10.13
- [ ] Install and run macOS 10.14
- [ ] Install and run macOS 10.15
- [ ] Install and run macOS 11
- [ ] Install and run macOS 12
- [ ] Successfully load any macOS version to desktop on Hyper-V
- [X] Keyboard Support
- [X] Trackpad Support
- [X] Touchscreen Support
- [ ] Audio Support
- [ ] Power Management Support
- [ ] Graphics Acceleration Support

## *** NOTICE ***
### Initial support for macOS 11 Big Sur has been completed. Guide and support files will be posted as soon as I can.
### CPU spoofing required if host machine has a CPU not supported by the version of macOS that you are installing. For example; if you have an 11th gen Intel or newer you would need to spoof the 10th gen to boot. Since I have an 11th gen intel I am testing on, this spoof is already added and others may need to remove this or may have some issues. 

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
- Nothing Else



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
- Trackpad
- TouchScreen / Stylus
- Recovery
- FileVault
- Bluetooth
- Brightness Keys





### Credits

Thanks to @acidanthera for creating the software, kexts, and patches, required to even begin to make this possible. I take no credit for any of this development and only seek to make an easy to use method for getting macOS running on Hyper-V. You can find original sources at the following links: [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg) & [Hyper-V Support](https://github.com/acidanthera/MacHyperVSupport). 
