##  Chapter 1) Install Guide 
## Requires a mac computer, macOS Virtual machine, or Hackintosh to complete this Install Guide. These steps are for a macOS Mojave install but it will work for several macOS versions. Big Sur and newer may need some code changes to work correctly.
## I have broken this down into sections as it is very detailed and easy to miss a step. 


## Section 1: Creating the Installer

1. On a mac, vm, or hackintosh download the macOS installer. See "Readme" for list of compatible versions.
2. Once the installer has downloaded, open Terminal and type the following command: (some installers may require you increase the "-size" as it must be able to hold the entire installer. 15000m should be more than enough.
    ```
    hdiutil create -o /tmp/YourDriveName -size 15000m -volname YourDriveName -layout SPUD -fs HFS+J
    ```
4. Mount the DMG file you just created by typing the following command in terminal:
    ```
    hdiutil attach /tmp/YourInstallerName.dmg -noverify -mountpoint /Volumes/YourDriveName
    ```
6. Next use "CreateInstallMedia" to create the macOS installer on the DMG we just created. (Don't install to a USB drive)
    ```
    sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Mojave --nointeraction
    ```
8. Once completed unmount the DMG Installer you just created:
    ```
    hdiutil detach /volumes/Install\ macOS\ Mojave
    ```
10. Once unmounted you need to convert it to a file that Microsoft's Hyper-V software can understand and run. We do this by converting it first to a ".CDR":
    ```
    hdiutil convert /tmp/Mojave.dmg -format UDTO -o ~/Desktop/Mojave.cdr
    ```
12. Now convert the ".CDR" to an "ISO":
    ```
    mv ~/Desktop/Mojave.cdr ~/Desktop/Mojave.iso
    ```
    
## Section 2: Creating the Hyper-V Virtual Machine

1. Copy the "Iso" you just created in macOS to the Windows computer you are setting the Hyper-V on.
2. Launch Hyper-V and create a new Virtual Machine (Don't use Hyper-V Quick Create). 
3. Name your new virtual machine and if you prefer you may change where it is stored. Click next
4. Select Generation 2. This won't work with a Generation 1
5. Increase your startup memory. 2,048 MB is the minimum but 4 or even 8 GB would be prefered. You should leave Dynamic Memory checked but you may uncheck it. Click Next.
6. Click "Connection" drop down and select "Default Switch" 
7. Name your "Virtual Hard Disk" and change your drive size to a size you prefer. The drive expands up to the max size you select here so keep that in mind when selecting the size. You may change the location of the virtual drive. Click Next
8. Select "Install an operating system later" and click next
9. Click Finish
10. Once Hyper-V finishes the setup of the Virtual Machine move on to Section 3


## Section 3: Modifying the Virtual Machines Drive

1. Go to the location of your Virtual Hard Drive you just created. Double Click it to Mount the drive. This should fail but move on to the next step
2. Right Click on "This PC" located on your Windows Desktop. Click "Manage". Once "Computer Management" opens, click "Disk Management"
3. Scroll down the bottom part of the window to find the drive you just mounted. It will be a differnt color showing that its a virtual drive.
4. Initialize the drive as GPT partition scheme
5. Right click on the drive and create partition.You must create a partion with FAT32 format of a minimum of 200mb but 300mb or even 1024mb is best. You will need 1024mb if you want to be able to use the web recovery in the future. Name your partition EFI. Leave all other settings default.
6. Once you have finished creating the EFI partion you will need to repeat the steps and create a new partion using the remaining space. Select the NTFS format and name the partion whatever you prefer. For the purpose of this instruction, I will assume its named "macOS". Leave all other settings default.
7. Minimize the "Computer Management" window for now and open your file explorer where you will see two new drives. You should have both a new EFI and macOS drive. 
8. Open the EFI partition you just mounted and copy the EFI folder from this Github into the root of the partions. The structure should have an EFI folder at the root of the drive and two folders within the EFI folder named BOOT and OC.
9. Close the File Explorer window and Maximize the "Computer Management" window
10. Right Click on the virtual drive and click "Detach VHD". Once the virtual drive has unmounted move on to Section 4


## Section 4: Installing macOS in Hyper-V

1. Launch Hyper-V. (It should have been closed before. If you left it open you MUST close it completely and then re-open it)
2. Right click on your new Hyper-V and click Settings. Change the following settings in order.
3. Adjust the following: Under Security uncheck "Enable Secure Boot" if its enabled
4. Adjust the following: Under Processor change the number of Virtual Processors to no more than half of the "Threads" available on your computer. (e.g. a Dual core computer usually has 4 threads and should have 2 virtual cores. More than this may slow down your computer)
5. Adjust the following: Under SCSI Controller select DVD Drive and click "Add". Click Image file and then click "Browse". Find and select the ISO you created earlier.
6. Click Apply
7. Adjust the following: Under Firmware adjust the boot order so the Hard Drive is first and the ISO is second. If you have a network or other option move those to the end of the list.
8. Adjust the following: Under Integration Services select all options
9. Click Apply and then OK
10. Double Click the new Virtual Machine. A window will open at which point you should click "Start"
11. Assuming everything has been done correctly you should shortly see the OpenCore boot menu and if not already selected, you should select the macOS installer and boot it.
12. This will take awhile but eventually the installer will load and you will have several options available to you.
13. Open Disk Utility
14. Select the "macOS" partition you created earlier and format it as APFS. Do not change any other settings and do not choose any other type of APFS format. DO NOT Format the entire drive either. If you accidently format the entire drive you must shut down the virtual machine and start again at Section 3, step 1.
15. Once formatted, exit Disk Utility
16. Launch the macOS installer and select your new "macOS" partion you just formatted. Accept the T&C's and keep clicking until it begins to install.
17. This install will take some time and may have a couple Kernel Panics along the way. Keep letting it reboot and don't stop the Virtual Machine. Eventually the installation will complete and you will be greeted with the Initial personalization set-up screens of your new macOS Hyper-V,
18. Congratulations and have fun


## Final Notes: 

This is still fairly buggy and may be very slow depending on the OS version you choose to use. As of this writting Catalina works well but Big Sur and newer a really slow due to the new animations.

If you need to update the EFI in the future, you should always turn off the Hyper-V virtual machine and repeat the steps included above in Section 3, steps 1 & steps 8-10.

It does appear that upgrading macOS in-place is working for the most part.

USB passthrough does not work as of this writting and so you would need to create another SCSI Hard Drive and using the steps in Section 3 format it in a compatible format to both Windows and macOS (e.g. FAT32 or extFAT work nicely)

