# File Servers on Linux

Linux file servers provide flexibility and control for data sharing. Tools like Samba and NFS are widely used for centralized file storage and management. This cheat sheet covers basic setups, advanced features, and best practices.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Basic Configuration](#basic-configuration)
   - [Samba Setup](#samba-setup)
   - [File Permissions](#file-permissions)
3. [Advanced Concepts](#advanced-concepts)
   - [NFS (Network File System)](#nfs-network-file-system)
   - [Advanced Permission Management with ACL](#advanced-permission-management-with-acl)
   - [Monitoring and Logs](#monitoring-and-logs)
4. [References](#references)

---

## 1. Introduction

Linux file servers enable centralized data storage, permission management, and efficient sharing. This guide covers basic configurations and advanced features for Samba and NFS.

---

## 2. Basic Configuration

### Samba Setup

1. **Installing Samba**:

```bash
sudo apt update
sudo apt install samba
```

2. **Configuring smb.conf File**:
   - Default location: `/etc/samba/smb.conf`.
   - Example of a simple share:
     ```
     [public]
     path = /srv/samba/public
     browsable = yes
     writable = yes
     guest ok = yes
     ```

3. **Restarting the Service**:

```bash
sudo systemctl restart smbd
```

4. **Adding Users to Samba**:

```bash
sudo smbpasswd -a username
```

### File Permissions

1. **Setting Permissions**:
   - Example of default permissions for a shared directory:
     ```bash
     sudo chmod 770 /srv/samba/public
     sudo chown nobody:nogroup /srv/samba/public
     ```

2. **Combining Samba and Linux Permissions**:
   - The final access combines Samba and Linux file system permissions.

---

## 3. Advanced Concepts

### NFS (Network File System)

1. **Installing NFS Server**:

```bash
sudo apt update
sudo apt install nfs-kernel-server
```

2. **Configuring /etc/exports File**:
   - Example:
     ```
     /srv/nfs 192.168.1.0/24(rw,sync,no_subtree_check)
     ```

3. **Restarting the Service**:

```bash
sudo systemctl restart nfs-kernel-server
```

### Advanced Permission Management with ACL

1. **Enabling ACL on File System**:

```bash
sudo mount -o remount,acl /srv
```

2. **Setting ACLs**:

```bash
sudo setfacl -m u:user:rwx /srv/samba/public
sudo getfacl /srv/samba/public
```

### Monitoring and Logs

1. **Samba Logs**:
   - Location: `/var/log/samba/`.

2. **Real-Time Monitoring**:

```bash
tail -f /var/log/samba/log.smbd
```

3. **Useful Tools**:
   - `smbstatus`: View active connections.

---

## 4. References

- Debian Wiki. [Samba](https://wiki.debian.org/Samba)
- Linux NFS. [Official Documentation](http://nfs.sourceforge.net/)
- Peterson, R. **Linux Server Administration**. Pearson, 2020.
