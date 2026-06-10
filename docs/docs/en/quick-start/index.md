# 5-Minute Quick Install OneNAS

This guide will help you complete the basic installation and configuration of OneNAS in 5 minutes.

## Prerequisites

Before you begin, make sure you have the following items ready:

- [ ] OneNAS device or a compatible computer
- [ ] At least one hard drive (SSD recommended for system disk)
- [ ] One Ethernet cable
- [ ] A working network environment

## Installation Steps

### 1. Connect Hardware

1. Install the hard drives into the device
2. Connect the Ethernet cable to your router/switch
3. Power on the device

### 2. Obtain IP Address

After the device boots, it will automatically obtain an IP address from your router. You can find it by:

- Logging into your router's admin interface to view the device list
- Using the `OneNAS.local` domain name (mDNS support required)

### 3. Initial Configuration

Open a browser and navigate to the obtained IP address. You will see the initial setup wizard:

1. **Set Admin Password**
   - Enter and confirm your administrator password
   - Password must be at least 8 characters, letters and numbers recommended

2. **Configure Network**
   - Choose whether to use DHCP for automatic IP assignment
   - Or manually set a static IP address

3. **Create Storage Pool**
   - Select the hard drives to use
   - Choose RAID type (RAID 1 or RAID 5 recommended)

4. **Complete Setup**
   - Confirm configuration details
   - Click the "Finish" button

## Verify Installation

After installation is complete, you can:

1. Log in to the web management interface
2. Create a test shared folder
3. Access it from your computer at `\\OneNAS.local\SharedFolderName`

## Next Steps

- 📚 [Learn Advanced Storage Configuration](../../index.md)
- 🔐 [Set Up Users and Permissions](../../index.md)
- 🔄 [Configure Automatic Backup](../../index.md)

## FAQ

### Cannot Access Web Interface?

- Check if the Ethernet cable is properly connected
- Confirm the device indicator light status
- Try accessing directly using the IP address

### Hard Drive Not Recognized?

- Confirm the hard drive is properly installed
- Check if the hard drive is compatible
- Try reseating the hard drive
