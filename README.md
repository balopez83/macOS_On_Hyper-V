# macOS on Hyper-V
This repository aims to provide support for macOS on Hyper-V

## Coming Soon

Initial support for macOS version 10.15.7 and above in-progress.

If you see anything that could be added or changed don't hesitate to make a pull request.


## *** NOTICE ***
### You may experience occasional sluggishness in the OS. This is due to a lack of full graphics acceleration. Please do not file an issue on this as it is a known issue. 

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

- Nothing



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
