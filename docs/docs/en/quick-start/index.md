# 5-Minute Quick Install OneNAS

This guide will help you complete the basic installation and configuration of OneNAS in 5 minutes.

## Prerequisites

Before you begin, make sure you have the following items ready:

- [ * ] A desktop PC or a laptop with an Ethernet port
- [ * ] At least one hard drive (SSD recommended for the system disk; system disk requires at least 5 GB, 60 GB recommended)
- [ * ] One Ethernet cable — installation requires a computer with an RJ45 wired Ethernet port
- [ * ] A working network environment

## Installation Steps

### 1. Create a Bootable USB Drive

Use Rufus to write the OneNAS system image to a USB drive:

1. **Prepare Tools**
   - Download and install [Rufus](https://rufus.ie/) (portable version recommended)
   - Prepare a 4 GB or larger USB drive (data will be erased, please back up in advance)
   - Download the OneNAS system ISO image file

2. **Write the Image**
   - Insert the USB drive and open Rufus
   - **Device**: Select your USB drive
   - **Boot selection**: Click the "Select" button and load the OneNAS ISO image file

     ![Rufus Main Interface](../images/cap-refus.jpg)

   - **Partition scheme**: `MBR`
   - **Target system**: `BIOS or UEFI`
   - **File system**: `FAT32 (Default)`
   - Click the **Start** button

3. **Choose Write Mode**
   - If a prompt says "ISOHybrid image detected", select **Write in ISO Image mode (Recommended)**

     ![Choose ISO Image Mode](../images/cap-refus-iso.jpg)

   - Confirm the format warning and wait for the write process to complete

### 2. Boot from USB Drive and Install the System

Insert the bootable USB drive into the target device, power it on, and select boot from USB:

1. **GRUB Boot Menu**
   - After powering on, you will see the OneNAS GRUB boot menu

     ![GRUB Boot Menu](../images/installation/onenas-livecd-grub-menu.jpg)

   - Use the up/down arrow keys to select **Start OneNAS SCALE Installation** and press Enter to confirm

2. **LiveCD Boot Loading**
   - The system will begin loading the file system into memory

     ![LiveCD Boot Loading](../images/installation/onenas-livecd-startup.jpg)
     ![LiveCD Install Menu](../images/installation/onenas-livecd-install-menu.jpg)


3. **Select Installation Language**
   - After loading completes, you will first enter the language selection screen

     ![Language Selection](../images/installation/onenas-livecd-language-cn.jpg)

   - Select **2 Chinese (中文)**, then press Enter to confirm

4. **Disk Erase Warning**
   - The system will list the disks to be installed on and warn that all partitions and data on these disks will be erased

     ![Disk Erase Warning](../images/installation/onenas-livecd-disk-erase-warning.jpg)

   - **Note**: This operation will clear all data on the selected disks. Make sure you have backed up important data.
   - After confirming, select **Yes** and press Enter to continue

5. **Partition Settings**
   - Next, you need to choose how the system partition is allocated

     ![Partition Settings](../images/installation/onenas-livecd-boot-disk-percent.jpg)

   - **full**: The entire disk is used as the system disk
   - **percentage**: Set by disk capacity percentage (recommended; allows reserving space on the same disk for a storage pool)
   - If you only have one hard drive, **be sure to select percentage** so the remaining space can be used to create a storage pool for file sharing and other purposes
   - After selecting, press Enter to confirm

6. **Swap Configuration**
   - Set the size of the swap partition

     ![Swap Configuration](../images/installation/onenas-livecd-swap.jpg)

   - **none**: Do not create swap
   - **half**: Create swap equal to 0.5x memory
   - **full**: Create swap equal to 1x memory (recommended)
   - If the system memory is **8 GB or less**, it is recommended to create a swap partition; this partition is included within the system partition
   - After selecting, press Enter to confirm

7. **Set Root Password**
   - Set the system root administrator password

     ![Set Root Password](../images/installation/onenas-livecd-root-password.jpg)

   - <span style="color: red;">The root password is one of the most important passwords for managing the OneNAS system</span>, so please remember it
   - Enter the password and press Enter, then enter it again to confirm

8. **Installation Successful**
   - After confirming, the system will begin automatic installation
   - The installation process takes about 1–3 minutes; please be patient
     ![Installation Successful](../images/installation/onenas-livecd-install-success.jpg)
   - When restarting, remove the USB drive to avoid entering LiveCD mode again

### 3. First System Boot

After installation, the device will enter the system management configuration interface on first boot:

1. **Boot Menu**
   - After the system boots, the boot management tool menu will be displayed
   - The system allows multiple versions; press ESC to select a different version
     ![System Boot Menu](../images/installation/onenas-startup-menu.jpg)


2. **System Configuration**

   - After the device boots, it will automatically obtain an IP address from the router via DHCP.

   - Select **Set Manual IP for Network Interface** to set a static IP address

     ![System Configuration Menu](../images/installation/onenas-sysconfig-menu.jpg)

   - After configuration, you can access the web management interface using the displayed IP address


### 5. Initial Configuration

Open a browser and visit the obtained IP address to start the web-based initial configuration:

1. **Handle Certificate and First Visit**
   - On first visit, the browser may warn that the security certificate is not trusted (because a self-signed certificate is used)

     ![Handle Certificate and First Visit](../images/installation/onenas-self-sign-certi.jpg)

   - Click **Advanced** or **Proceed**, then choose to accept and continue

2. **Create Administrator Account**
   - On first visit to the web interface, the system will require creating the first administrator account

     ![Create Administrator Account](../images/installation/onenas-create-admin-account.jpg)

   - **Note**: <span style="color: red;">The two most important accounts and passwords for managing OneNAS are: first, the root password set during installation; second, the administrator account and password set here</span>
   - Enter the username, password, and confirm password
   - Click the **Create** button to complete the administrator account creation

3. **Log In to the Web Management Interface**
   - Log in using the administrator account you just created

     ![Web Management Interface](../images/installation/onenas-admin-web.jpg)

   - After logging in, you will see the OneNAS web management interface, including modules such as User Management, Storage, Samba, and Docker

## Verify Installation

After installation is complete, you can:

1. Log in to the web management interface and confirm that each functional module displays normally
2. Create a test shared folder
3. Access it from your computer at `\\192.268.3.204\SharedFolderName`

### Forgot the Root Password?

- Restart via LiveCD and select repair mode to reset the password
- Or refer to the password recovery guide in the official documentation
