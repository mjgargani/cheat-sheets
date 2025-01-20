# File Servers on Windows

Windows file servers enable centralized data storage, permission management, and efficient file sharing. This cheat sheet covers basic setups, advanced features, and best practices for managing Windows-based file servers.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Basic Configuration](#basic-configuration)
   - [Enabling File Sharing](#enabling-file-sharing)
   - [Access Permissions](#access-permissions)
3. [Advanced Concepts](#advanced-concepts)
   - [Configuring a File Server via Active Directory](#configuring-a-file-server-via-active-directory)
   - [Disk Quota Management](#disk-quota-management)
   - [Remote Access and DFS](#remote-access-and-dfs)
4. [References](#references)

---

## 1. Introduction

File servers on Windows are critical for centralized data storage, offering robust tools for managing permissions and facilitating efficient file sharing. This guide provides practical steps for both basic and advanced setups.

---

## 2. Basic Configuration

### Enabling File Sharing

1. **Installing the File Server Role**:
   - Access the **Server Manager**.
   - Click "Add Roles and Features".
   - Select "File and Storage Services" and enable the "File Server" role.

2. **Configuring a Simple Share**:
   - Right-click the desired folder and select "Properties".
   - Navigate to the "Sharing" tab and click "Advanced Sharing".
   - Enable "Share this folder" and configure permissions.

### Access Permissions

1. **Sharing Permissions**:
   - Configured under the "Sharing" tab.
   - Examples: "Full Control," "Change," "Read".

2. **NTFS Permissions**:
   - Configured under the "Security" tab.
   - Provides more granular control, such as "Write" or "Modify".

3. **Effective Permissions**:
   - The most restrictive setting between Sharing and NTFS applies.

---

## 3. Advanced Concepts

### Configuring a File Server via Active Directory

1. **AD Integration**:
   - Create security groups in AD for easier permission management.
   - Assign permissions to groups instead of individual users.

2. **Centralized User Profiles**:
   - Configure "Home Folders" to store user profile data on centralized servers.

### Disk Quota Management

1. **Enabling Quotas**:
   - Access the **File Server Resource Manager**.
   - Configure quotas per volume or folder.

2. **Example Policy**:
   - Limit each user to 10 GB of storage.

### Remote Access and DFS

1. **Remote Access Configuration**:
   - Use **Remote Desktop Services** or **VPN** for secure connections.

2. **DFS (Distributed File System)**:
   - Create a unified namespace to simplify access to multiple servers.
   - Configure via **DFS Management**.

---

## 4. References

- Microsoft Docs. [File Server Management](https://docs.microsoft.com/en-us/windows-server/storage/file-server/)
- Peterson, R. **Windows Server Administration**. Pearson, 2020.
