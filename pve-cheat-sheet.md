# ProxMox Virtual Environment 8.3.1 Cheat Sheet (2024)

## General Information

-   **Version**: 8.3.1
-   **OS Base**: Debian 12 (Bookworm)
-   **Kernel**: 6.1 LTS (by default)
-   **Hypervisor Type**: Type 1 (Bare-metal)
-   **Virtualization**: KVM (for VMs), LXC (for Containers)
-   **Web Interface**: Available at `https://<server-ip>:8006`

## Installation & Setup

### Download ISO

-   Download from: [https://www.proxmox.com/downloads](https://www.proxmox.com/downloads)

### Basic Installation (Debian 12-based)

```bash
# Update system before installing Proxmox VE
apt update && apt full-upgrade -y

# Install Proxmox VE
apt install proxmox-ve postfix open-iscsi -y

# Remove conflicting packages
apt remove os-prober

# Reboot after installation
reboot
```

### Post-Installation

```bash
# Update Proxmox VE
apt update && apt dist-upgrade -y

# Remove the enterprise repo (if not subscribed)
sed -i 's/^deb/#deb/' /etc/apt/sources.list.d/pve-enterprise.list

# Add community repo
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list

# Update repository and upgrade
apt update && apt dist-upgrade -y

# Reboot to ensure kernel updates apply
reboot
```

---

## Networking

### Show Network Interfaces

```bash
ip a
```

### Configure Static IP (Bridge Mode)

```bash
nano /etc/network/interfaces

# Example configuration (replace values accordingly)
auto vmbr0
iface vmbr0 inet static
    address 10.66.166.2/23
    gateway 10.66.166.1
    bridge_ports enp0s31f6
    bridge_stp off
    bridge_fd 0
```

```bash
# Apply Changes
systemctl restart networking
```

---

## VM Management

### Create VM

```bash
qm create 100 --name ubuntu-server --memory 4096 --net0 virtio,bridge=vmbr0 --cores 2 --cpu host
```

### Import ISO

```bash
pvesm alloc local iso ubuntu-22.04.iso 2G
wget -O /var/lib/vz/template/iso/ubuntu-22.04.iso <ISO_URL>
```

### Start VM

```bash
qm start 100
```

### Stop VM

```bash
qm stop 100
```

### Delete VM

```bash
qm destroy 100
```

### Resize Disk (without VM running)

```bash
qm resize 100 scsi0 +10G
```

---

## LXC Container Management

### Create Container

```bash
pct create 101 local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst --hostname debian-container --storage local-lvm --password YOUR_PASSWORD --rootfs 8G --cores 2 --memory 2048 --net0 name=eth0,bridge=vmbr0,ip=dhcp
```

### Start Container

```bash
pct start 101
```

### Stop Container

```bash
pct stop 101
```

### Destroy Container

```bash
pct destroy 101
```

### Resize LXC Disk

```bash
lvextend -L+5G /dev/pve/vm-101-disk-0
resize2fs /dev/pve/vm-101-disk-0
```

---

## Storage Management

### List Storage

```bash
pvesm status
```

### Add NFS Storage

```bash
pvesm add nfs nfs-storage --server 10.66.166.5 --export /mnt/share --path /mnt/pve/nfs-storage
```

### Resize LVM (Expand Storage)

```bash
lvextend -L+100G /dev/pve/data
resize2fs /dev/pve/data
```

---

## Backup & Restore

### Backup VM

```bash
vzdump 100 --storage local --compress zstd --dumpdir /var/lib/vz/dump/
```

### Restore VM

```bash
qmrestore /var/lib/vz/dump/vzdump-qemu-100-YYYY_MM_DD-HH_mm_ss.vma.zst 200
```

---

## Cluster Management

### Create Cluster

```bash
pvecm create cluster-name
```

### Add Node to Cluster

```bash
pvecm add <master-node-ip>
```

### Remove Node from Cluster

```bash
pvecm delnode node-name
```

---

## Troubleshooting

### Restart Proxmox Services

```bash
systemctl restart pve-cluster pvedaemon pveproxy pvestatd
```

### Check Logs

```bash
journalctl -u pve-cluster -f
```

### Force Stop VM

```bash
qm stop 100 --skiplock
```

---

## Deprecated Commands (2024)

-   **`ifup` / `ifdown`** - Deprecated in favor of `ip link set <iface> up/down`
-   **`service networking restart`** - Use `systemctl restart networking`
-   **`brctl`** - Use `ip link` or `nmcli` instead

---

## Additional Resources

-   [Official Documentation](https://pve.proxmox.com/wiki/Main_Page)
-   [Community Forum](https://forum.proxmox.com)
-   [Proxmox GitHub](https://github.com/proxmox)
