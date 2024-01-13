# Module script: New-MacOSVM.psm1

function New-MacOSVM {
    param (
        [string]$Release,
        [string]$VHD="$Release recovery.vhdx",
        [bool]$OnlyVHD = $false,
        [string]$VMName = $Release,
        [int64]$VMRAM = 8GB,
        [int64]$VMDiskSize = 80GB,
        [string]$VMSwitch = "Default Switch"
    )
    
    if (Test-Path -path $VHD) {
        Write-Error "Target VHD $VHD allready exists."
        return
    }
    
    # Get the directory of the script
    $ScriptDirectory = $PSScriptRoot
    
    # Construct the full path to the JSON file
    $jsonFile = Join-Path -Path $ScriptDirectory -ChildPath "macos_recovery.json"
    $recoveryData = ConvertFrom-Json (Get-Content -Raw -Path $jsonFile)
    
    # Search for the release key in the JSON data
    # Load the JSON file
    $recoveryCommands = $null
    if (Test-Path -Path $jsonFile -PathType Leaf) {
        $recoveryData = ConvertFrom-Json (Get-Content -Raw -Path $jsonFile)
    
        # Check if the release exists in the JSON data
        if ($recoveryData.$Release -eq $null) {
            Write-Host "MacOS release '$Release' not found, available versions:"
            $recoveryData.PSObject.Properties.Name | ForEach-Object { Write-Host "$_" }
            return
        }
    
        $recoveryCommands = $recoveryData.$Release
    } else {
        Write-Error "macos_recovery.json not found in the script directory."
        return
    }
    
    
    $current = Get-Location
    
    # Create a temporary folder under %temp%
    $TempFolder = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.Guid]::NewGuid().ToString())
    
    # Create the temporary folder
    $null = New-Item -Path $TempFolder -ItemType Directory
    
    try {
        Write-Verbose "Downloading OpenCore and macOS_On_Hyper-V tools.."
    
        # Define the URLs
        $UEFI_URL = "https://github.com/balopez83/macOS_On_Hyper-V/releases/download/2.3.1/UEFI_OC095_r2.3.1.7z"
        $OpenCore_URL = "https://github.com/acidanthera/OpenCorePkg/releases/download/0.9.7/OpenCore-0.9.7-RELEASE.zip"
    
        # Create the VHD from the current folder or use the fully qualified path if provided
        if ($VHD -notlike "*:\*") {
            $VHD = Join-Path -Path $ScriptDirectory -ChildPath $VHD
        }
    
        # Download and extract UEFI file
        Invoke-WebRequest -Uri $UEFI_URL -OutFile (Join-Path -Path $TempFolder -ChildPath "UEFI.7z")
        $ignore = & "C:\Program Files\7-Zip\7z.exe" x (Join-Path -Path $TempFolder -ChildPath "UEFI.7z") -o".\" -aoa
    
        move-item -path .\UEFI.vhdx -Destination "$VHD"
    
        # Download and extract OpenCore file directly into the TempFolder
        Invoke-WebRequest -Uri $OpenCore_URL -OutFile (Join-Path -Path $TempFolder -ChildPath "OpenCore.zip")
        Expand-Archive -Path (Join-Path -Path $TempFolder -ChildPath "OpenCore.zip") -DestinationPath $TempFolder -Force
    
       
        # Mount the UEFI.vhdx
        $mountpoint = mount-vhd -path "$VHD" -Passthru
        $disk = (get-disk | ? Location -eq $mountpoint.path)
        $volume = ($disk | Get-Partition)[1] | get-volume
    
        Set-Location -Path $TempFolder\Utilities\macrecovery
    
        Write-Verbose "Downloading $Release and updating vhdx"
        foreach ($command in $recoveryCommands) {
            $ignore=Invoke-Expression $command
        }
    
        Move-Item -Path ".\com.apple.recovery.boot" -Destination ($volume.DriveLetter + ":\")
    
    } finally {
        # Change back to the original directory before cleaning up
        Set-Location -Path $current
    
        # Dismount the UEFI.vhdx
        $mountpoint | dismount-vhd
    
        # Remove the temporary folder
        Remove-Item -Path $TempFolder -Recurse -Force
    
      
    }
    
    Write-Verbose "$VHD Ready."
    
    if (-not $OnlyVHD) {
        Write-Verbose "Creating VM $VMName"
    
        # If already exists, make the VM name unique
        if (Test-Path -path "C:\ProgramData\Microsoft\Windows\Hyper-V\$VMName.vhdx") {
            $VMName += " " + (Get-ChildItem -Path "C:\ProgramData\Microsoft\Windows\Hyper-V" | Where-Object { $_.Name -like "$VMName*" }).Count
        }
    
        $vm = New-VM -Name $VMName -Generation 2 -MemoryStartupBytes $VMRAM -NewVHDPath "C:\ProgramData\Microsoft\Windows\Hyper-V\$VMName.vhdx" -NewVHDSizeBytes $VMDiskSize -SwitchName $VMSwitch
    
        # Attach the UEFI.vhdx as a SCSI disk
        $disk = $vm | Add-VMHardDiskDrive -Path "$VHD" -ControllerType SCSI -Passthru
    
        # Set the SCSI disk as the primary boot disk
        $vm | Set-VMFirmware -EnableSecureBoot Off -FirstBootDevice $disk
    
        $vm | Enable-VMIntegrationService -Name "Guest Service Interface"
    
        $vm | Set-VM  -CheckpointType Disabled -ProcessorCount 2
    
        Write-Verbose "Hyper-V VM $VMName Ready."
    
        $vm
    } else {
        Get-Item -Path "$VHD"
    }

   
}

 # Export any functions or variables as needed
 Export-ModuleMember -Function New-MacOSVM
