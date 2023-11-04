##  Chapter 1) Install Guide 
### No longer requires a real mac, hackintosh, or virtual machine to use.
### This guide could go out of date in the future. If you have questions or want to get more information from the source please go to [@acidanthera MacHyperVSupport on Github](https://github.com/acidanthera/MacHyperVSupport)
### Note: Legacy 10.4.x - 10.7.x cannot be installed directly. You must first install a newer modern macOS version, download an Acidanthera version of macOS 10.4 - 10.7 from [here](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/mac-install-dmg.html) and follow the directions to restore the image to a clean drive you make in Hyper-V. You can follow the below directions for creating the VM and then simply make an additional clean drive for restoring that OS to. Afterwards you can use that drive in its own Hyper-V VM.

## Section 1: Prerequisites.

1. Be sure to install Hyper-V and Virtual Machine Platform through the add Windows Components program on your Windows 10/11 machine
2. Download the latest UEFI.VHDX zip/7z from my repo, extract it to a convenient location.
3. Install [Python](https://www.python.org/downloads/).
4. Download the latest version of OpenCore (we need a tool from this for step 5)
5. Download the recovery image for the OS version you want to install using the instructions on this [page](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/windows-install.html#downloading-macos). Save the com.apple.recovery.boot folder with the UEFI.VHDX you downloaded earlier.
6. Right Click on the com.apple.recovery.boot folder you just downloaded and click "Copy". Then double click on the UEFI.VHDX. This will mount the UEFI drive and open it.
7. Right Click in the mounted UEFI drive explorer window that just opened and click "Paste". You should now have three folders.
8. Go to "This PC" and Right Click on the mounted UEFI drive and click "Eject"
    
## Section 2: Creating the Hyper-V Virtual Machine

1. Launch Hyper-V and create a new Virtual Machine (Don't use Hyper-V Quick Create). 
3. Name your new virtual machine and if you prefer you may change where it is stored. Click next
4. Select Generation 2. This won't work with a Generation 1
5. Increase your startup memory. 4gb is the minimum for Catalina and older; 8gb is the minimum for Big Sur and newer. You should leave Dynamic Memory checked. Click Next.
6. Click "Connection" drop down and select "Default Switch" 
7. Name your "Virtual Hard Disk" and change your drive size to a size you prefer. The drive expands up to the max size you select here so keep that in mind when selecting the size. You may change the location of the virtual drive. Click Next
8. Select "Install an operating system later" and click next
9. Click Finish
10. Once Hyper-V finishes the setup of the Virtual Machine move on to Section 3


## Section 3: Installing macOS in Hyper-V

1. Launch Hyper-V if you closed it.
2. Right click on your new Hyper-V and click Settings. Change the following settings in order.
3. Adjust the following: Under Security uncheck "Enable Secure Boot" if its enabled
4. You may enable or disable TPM as I am unaware of any negative impact on the VM
5. Adjust the following: Under Processor change the number of Virtual Processors to no more than half of the "Threads" available on your computer. (e.g. a Dual core computer usually has 4 threads and should have 2 virtual cores. More than this may slow down your computer)
6. Disable Checkpoints otherwise you will have issues later in your Hyper-V use.
7. Adjust the following: Under SCSI Controller select Hard Drive and click "Add". Click "Browse" under Virtual Hard Disk. Find and select the UEFI.VHDX you downloaded and updated earlier.
8. Click Apply
9. Adjust the following: Under Firmware adjust the boot order so the UEFI.VHDX Hard Drive is first and the other Hard Drive is second. If you have a network or other option move those to the end of the list.
10. Adjust the following: Under Integration Services select all options
11. Click Apply and then OK
12. Double Click the new Virtual Machine. A window will open at which point you should click "Start"
13. Assuming everything has been done correctly you should shortly see the OpenCore boot menu and if not already selected, you should select the macOS recovery and boot it (You may need to press the space bar to expose this option).
14. This will take awhile but eventually the installer will load. During startup it may appear to freeze at an early boot but it will continue. If it appears to freeze in a later part of the boot process you can click the reset button to restart. It can take up to 5 min to boot so be patient. Depending on the OS you are trying to install you may have to reset it a few times before you have a successful boot.
15. Once the recovery loads open Disk Utility
16. Select the "Msft Virtual Disk Media" drive you created earlier (should be blank with no partitions) and format it as APFS with whatever name you want for the partition (e.g. "Macintosh HD"). 
17. Once formatted, exit Disk Utility
18. Launch the macOS installer and select your new "macOS" partion you just formatted. Accept the T&C's and keep clicking until it begins to install.
19. This install will take some time and may have a couple Kernel Panics along the way. Keep letting it reboot and don't stop the Virtual Machine. Eventually the installation will complete and you will be greeted with the Initial personalization set-up screens of your new macOS Hyper-V,
20. Congratulations and have fun


## Final Notes: 

This is still fairly buggy and may be very slow depending on the OS version you choose to use. Please see Chapter 2 Quirks & Fixes for some ways to improve the OS despite a lack of graphics acceleration. 

If you need to update the EFI in the future, you can mount your UEFI.VHDX and edit your config.plist with ProperTree

It does appear that upgrading macOS in-place is working for the most part.

USB passthrough does not work as of this writting and so you would need to create another SCSI Hard Drive and mount it in Windows. Copy files to the new VHDX and then once done, eject the drive and then mount with your Hyper-V virtual machine.

