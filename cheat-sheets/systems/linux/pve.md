# Proxmox VE Cheat Sheet

Proxmox Virtual Environment (VE) is an open-source virtualization platform based on Debian, integrating support for both virtual machines (KVM) and containers (LXC). It is widely used for enterprise-grade deployments, offering a user-friendly web interface, robust clustering capabilities, and built-in tools for backup, high availability, and resource management. This cheat sheet provides essential commands, configurations, and best practices for effectively managing Proxmox VE environments.

## Table of Contents

1. [Introduction to Proxmox VE](#introduction-to-proxmox-ve)
2. [Installation](#installation)
3. [Network Management](#network-management)
4. [Virtual Machine Management](#virtual-machine-management)
5. [Container Management](#container-management)
6. [Storage Management](#storage-management)
7. [Backup and Restore](#backup-and-restore)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

### Introduction to Proxmox VE

Proxmox VE is designed to simplify the management of virtualized workloads through an intuitive web interface and comprehensive tools. It supports multiple hypervisor technologies, combining Kernel-based Virtual Machine (KVM) for full virtualization and Linux Containers (LXC) for lightweight virtual environments. Common use cases include:

- **Virtualized Infrastructure**: Hosting virtual machines and containers.
- **High Availability**: Building resilient clusters for critical applications.
- **Centralized Management**: Simplified administration via a web GUI and REST API.

For more details, visit the [Proxmox VE Official Website](https://www.proxmox.com/).

---

### Installation

1. **Download the Proxmox VE ISO**: [Download Link](https://www.proxmox.com/en/downloads).
2. **Prepare the Environment**:

```bash
# Update the system before installation
apt update && apt full-upgrade -y

# Install Proxmox VE
apt install proxmox-ve postfix open-iscsi -y

# Remove conflicting packages
apt remove os-prober

# Reboot the system
reboot
```

---

### Network Management

- **View Network Interfaces**:

```bash
ip a
```

- **Configure a Static IP (Bridge Mode)**:

```bash
nano /etc/network/interfaces

# Example configuration
auto vmbr0
iface vmbr0 inet static
    address 192.168.1.10/24
    gateway 192.168.1.1
    bridge_ports enp0s31f6
    bridge_stp off
    bridge_fd 0
```

- **Apply Network Changes**:

```bash
systemctl restart networking
```

---

### Virtual Machine Management

- **Create a Virtual Machine**:

```bash
qm create 100 --name ubuntu-server --memory 4096 --net0 virtio,bridge=vmbr0 --cores 2 --cpu host
```

- **Start a Virtual Machine**:

```bash
qm start 100
```

- **Stop a Virtual Machine**:

```bash
qm stop 100
```

---

### Container Management

- **Create a Container**:

```bash
pct create 101 /var/lib/vz/template/cache/debian-11-standard.tar.gz --rootfs local-lvm:8 --memory 2048 --net0 name=eth0,bridge=vmbr1,ip=192.168.1.101/24,gw=192.168.1.1
```

- **Start a Container**:

```bash
pct start 101
```

- **Stop a Container**:

```bash
pct stop 101
```

---

### Storage Management

- **Add a Storage Device**:

```bash
pvesm add dir local-backup --path /mnt/backup --content backup
```

- **List Available Storage**:

```bash
pvesm status
```

---

### Backup and Restore

- **Backup a Virtual Machine**:

```bash
vzdump 100 --storage local --compress zstd --dumpdir /var/lib/vz/dump/
```

- **Restore a Virtual Machine**:

```bash
qmrestore /var/lib/vz/dump/vzdump-qemu-100-YYYY_MM_DD-HH_mm_ss.vma.zst 200
```

---

### Deprecated Features

Refer to the [official documentation](https://pve.proxmox.com/wiki/Main_Page) for a list of deprecated features and their alternatives.

---

### Additional References

- [Proxmox VE Documentation](https://pve.proxmox.com/)
- [Proxmox Community Forum](https://forum.proxmox.com/)
- [Proxmox VE Git Repository](https://git.proxmox.com/)
