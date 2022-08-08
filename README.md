# macOS on Hyper-V
This repository aims to provide support for macOS on Hyper-V

## Current State:

OpenCore Bootloader boots in Hyper-V and will select installer. macOS installer fails at early boot and will not yet begin loading the kernel. 


## *** NOTICE ***
### I will post the EFI and instructions once the project is in s a state where it can load the kernel. Thank you for your patience while I work through the initial issues. 

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
