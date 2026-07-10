# How to Create a RAID1 Mirror

RAID1 (mirroring) is a storage configuration that writes the same data to two or more drives simultaneously. If one drive fails, the other drive retains a complete copy of the data, ensuring data safety.

## RAID1 Characteristics

- ✅ **Data safety**: Every file has a complete mirror copy; single-drive failure does not cause data loss
- ✅ **Improved read performance**: Data can be read from multiple drives at the same time
- ⚠️ **Capacity is halved**: With two drives, usable capacity equals the size of the smallest drive
- ⚠️ **Slightly lower write performance**: Each write must be synchronized to multiple drives

## Use Cases

- Storing important documents, photos, videos, and other irreplaceable data
- Core data storage for home or small office environments
- Scenarios where data safety is more important than raw capacity

## Prerequisites

Before creating a RAID1 mirror, please confirm the following:

- [ ] At least two drives of the same or similar capacity (same brand and capacity recommended)
- [ ] The drives are correctly installed and connected to the OneNAS device
- [ ] You have logged in to the OneNAS web management interface
- [ ] **Important**: Creating RAID1 will erase all data on the selected drives. Back up your data first.

!!! warning "Data Safety Warning"
    During RAID1 creation, the selected drives will be initialized and partitioned, and all existing data will be erased. Please back up important data before proceeding.

## Creation Steps

### 1. Log In to the Web Management Interface

Enter the OneNAS IP address in your browser and log in with an administrator account.

![Web Management Interface](../images/installation/onenas-admin-web.jpg)

### 2. Open Storage Management

In the top navigation bar or side menu, click **Storage** to open the storage management page.

### 3. Create a Storage Pool

On the storage management page, click **Create Pool** or **Add Pool**.

### 4. Configure the Storage Pool

1. **Enter a pool name**
   - Examples: `tank`, `data`, `raid1-pool`
   - Use letters and numbers; avoid special characters

2. **Select RAID1 type**
   - In the layout or RAID level options, select **Mirror / RAID1**
   - Depending on the interface, RAID1 may be labeled as **Mirror** or **RAID1**

### 5. Select Drives

1. In the available disk list, check the two (or more) drives you want to include in the RAID1
2. It is recommended to select drives with identical capacity to avoid wasting space

!!! tip "Drive Selection Recommendations"
    - Prefer drives with the same capacity and model
    - Avoid mixing drives with different speeds or interface types
    - If drive capacities differ, RAID1 usable capacity is determined by the smallest drive

### 6. Confirm and Create

1. Review the configuration summary and confirm the RAID level is **RAID1 / Mirror**
2. Verify that the selected drives are correct
3. Click **Create** or **Save**

!!! warning "Final Confirmation"
    Creating the pool will erase all data on the selected drives. Please confirm that you have backed up important data.

### 7. Wait for Initialization to Complete

The system will automatically initialize the RAID1 array. This may take from a few minutes to several hours, depending on drive capacity.

- The pool can be used normally during initialization
- After initialization, the RAID1 status will show as **Normal** or **Healthy**

## Verify RAID1

After creation, it is recommended to perform the following checks:

1. **Check pool status**
   - Open the storage management page
   - Confirm that the RAID1 pool status shows Healthy

2. **Create a test dataset**
   - Create a dataset or shared folder on the pool
   - Test whether file read and write operations work normally

3. **Create a share**
   - Access via SMB share: `\\OneNAS_IP\SharedFolderName`
   - Test file upload and download

## Frequently Asked Questions

### Q: How many drives does RAID1 require?

A: RAID1 requires at least two drives. With two drives, usable capacity equals the capacity of one drive. With more drives, you still only lose the capacity of one drive while gaining higher read performance.

### Q: What should I do if one drive fails?

A: RAID1 allows continued operation with a single failed drive. Replace the failed drive as soon as possible, then perform a **resilver** or **replace** operation in the storage management page. The system will automatically mirror data to the new drive.

### Q: Does RAID1 protect against accidental deletion?

A: No. RAID1 only protects against data loss caused by physical drive failure. It does not protect against accidental deletion, viruses, or ransomware. It is recommended to use snapshots or off-site backups together with RAID1.

## Recommendations

- Regularly check RAID1 status in the web management interface
- Configure email or notification alerts to stay informed about drive failures
- Important data should also be backed up off-site
- Familiarize yourself with drive replacement and rebuild procedures
