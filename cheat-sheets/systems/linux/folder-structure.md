# Linux Folder Structure Cheat Sheet

Understanding the Linux directory structure is fundamental for system administration, development, and troubleshooting. Linux organizes its files and directories in a hierarchical tree structure starting from the root directory `/`. This cheat sheet explains the purpose of standard directories in Linux systems, focusing on Ubuntu-based distributions.

## Table of Contents

1. [Introduction](#introduction)
2. [Standard Directory Structure](#standard-directory-structure)
   - [/ - Root](#-root)
   - [/bin - Essential Binaries](#bin---essential-binaries)
   - [/boot - Boot Files](#boot---boot-files)
   - [/dev - Device Files](#dev---device-files)
   - [/etc - Configuration Files](#etc---configuration-files)
   - [/home - User Directories](#home---user-directories)
   - [/lib and /lib64 - Libraries](#lib-and-lib64---libraries)
   - [/media and /mnt - Mount Points](#media-and-mnt---mount-points)
   - [/opt - Optional Software](#opt---optional-software)
   - [/proc - Process Information](#proc---process-information)
   - [/root - Root User Home](#root---root-user-home)
   - [/sbin - System Binaries](#sbin---system-binaries)
   - [/tmp - Temporary Files](#tmp---temporary-files)
   - [/usr - User System Resources](#usr---user-system-resources)
   - [/var - Variable Data](#var---variable-data)
3. [Advanced Concepts](#advanced-concepts)
   - [Virtual File Systems](#virtual-file-systems)
   - [Mount Points](#mount-points)
4. [References](#references)

---

## Introduction

The Linux file system is structured to provide logical organization and ease of use. Each directory serves a specific purpose, enabling users and applications to interact with the system effectively. This organization follows the [Filesystem Hierarchy Standard (FHS)](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html), ensuring consistency across distributions.

---

## Standard Directory Structure

### / - Root
The root directory is the starting point of the Linux filesystem hierarchy. All other directories branch from here.

---

### /bin - Essential Binaries
Contains critical system commands and binaries available to all users. Examples:

```bash
/bin/ls  # List directory contents
/bin/cp  # Copy files and directories
```

---

### /boot - Boot Files
Holds files required to boot the system, including the kernel and bootloader configurations. Examples:

```bash
/boot/vmlinuz  # Linux kernel
/boot/grub  # GRUB bootloader settings
```

---

### /dev - Device Files
Contains special files representing devices. Examples:

```bash
/dev/sda1  # First partition of the first disk
/dev/null  # Discard output
```

---

### /etc - Configuration Files
Stores system-wide configuration files. Examples:

```bash
/etc/fstab  # Mount configuration
/etc/hosts  # Static hostname mapping
```

---

### /home - User Directories
Contains personal directories for each user. Example:

```bash
/home/john  # Home directory for user 'john'
```

---

### /lib and /lib64 - Libraries
Holds shared libraries needed by binaries in `/bin` and `/sbin`. Examples:

```bash
/lib/x86_64-linux-gnu/libc.so.6  # Standard C library
```

---

### /media and /mnt - Mount Points
- **/media**: Automatically mounted removable devices (e.g., USB drives).
- **/mnt**: Temporary mount points for manual use.

---

### /opt - Optional Software
Contains software installed manually or outside of the standard package management system. Example:

```bash
/opt/google/chrome
```

---

### /proc - Process Information
A virtual filesystem providing real-time system information. Examples:

```bash
/proc/cpuinfo  # CPU details
/proc/meminfo  # Memory usage
```

---

### /root - Root User Home
The home directory for the root (administrator) user.

---

### /sbin - System Binaries
Contains essential binaries for system administration, typically executed by the root user. Example:

```bash
/sbin/reboot  # Reboot the system
```

---

### /tmp - Temporary Files
Stores temporary files that may be cleared automatically. Used by applications and processes.

---

### /usr - User System Resources
Holds secondary programs and libraries for users. Common subdirectories include:

- `/usr/bin`: User executables.
- `/usr/lib`: Libraries.
- `/usr/share`: Shared resources (e.g., man pages).

---

### /var - Variable Data
Contains files with dynamic content, such as logs and caches. Example:

```bash
/var/log/syslog  # System log
```

---

## Advanced Concepts

### Virtual File Systems
Directories like `/proc` and `/sys` are virtual and dynamically generated, providing system and kernel information in real-time.

### Mount Points
A mount point is where a filesystem is accessed. Examples:

- Mount a disk manually:

```bash
sudo mount /dev/sdb1 /mnt/data
```

- View mounted filesystems:

```bash
mount | grep /mnt
```

---

## References

- The Linux Documentation Project: [Filesystem Hierarchy Standard](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/).
- Ubuntu Documentation: [Linux Directory Structure](https://ubuntu.com/tutorials/directory-structure).
- Nemeth, E. **UNIX and Linux System Administration Handbook**. Pearson, 2017.
- Linux Foundation: [FHS 3.0 Specification](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html).
