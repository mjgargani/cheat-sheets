# OPNsense Cheat Sheet

OPNsense is an open-source, FreeBSD-based firewall and routing platform. It provides robust security features, a modern user interface, and a strong community. This cheat sheet compiles essential commands, configuration examples, and web interface usage to streamline OPNsense administration.

## Table of Contents

1. [Introduction to OPNsense](#introduction-to-opnsense)
2. [Installation](#installation)
3. [Initial Setup](#initial-setup)
4. [Networking and Interfaces](#networking-and-interfaces)
5. [Firewall and NAT Rules](#firewall-and-nat-rules)
6. [VPN Configuration](#vpn-configuration)
7. [Backup and Restore](#backup-and-restore)
8. [Monitoring and Logs](#monitoring-and-logs)
9. [Web Interface Guide](#web-interface-guide)
10. [Additional Resources](#additional-resources)

---

### Introduction to OPNsense

OPNsense is designed for ease of use, offering a modern web interface, frequent updates, and comprehensive security features such as:

- Firewall and NAT
- VPN (IPsec, OpenVPN, WireGuard)
- Intrusion Detection and Prevention (IDS/IPS)
- Traffic Shaping and QoS
- Centralized Logging and Reporting

[Learn more at the official website](https://opnsense.org/).

---

### Installation

1. **Download the ISO**:
   - [Official Download Page](https://opnsense.org/download/).

2. **Create Bootable Media**:
   ```bash
   # Example for Linux
   dd if=OPNsense-<version>.iso of=/dev/sdX bs=4M status=progress
   sync
   ```

3. **Follow the Installer**:
   - Default username: `installer`
   - Default password: `opnsense`
   - Assign LAN/WAN interfaces during installation.

---

### Initial Setup

1. **Access Web Interface**:
   - Default IP: `192.168.1.1`
   - Default credentials: `root` / `opnsense`

2. **Change Default Password**:
   Navigate to **System → Settings → Administration**.

3. **Configure Interfaces**:
   - Use the console or the web interface to assign and configure interfaces.

---

### Networking and Interfaces

- **List Interfaces**:
  ```bash
  ifconfig
  ```

- **Assign Interfaces via Console**:
  ```bash
  # Follow console prompts to assign or reassign interfaces
  ```
  Use **Option 1** in the console menu.

- **Configure Static IP**:
  Navigate to **Interfaces → [Interface Name] → Static IP Configuration**.

- **DHCP Configuration**:
  - Enable: **Services → DHCP Server**.
  - Assign ranges and options per interface.

---

### Firewall and NAT Rules

- **Add Firewall Rules**:
  1. Go to **Firewall → Rules → [Interface]**.
  2. Click **+ Add** and specify:
     - Source/Destination
     - Protocol
     - Ports
  3. Save and apply changes.

- **NAT Port Forwarding**:
  1. Navigate to **Firewall → NAT → Port Forward**.
  2. Specify:
     - Interface
     - Source/Destination
     - Redirect Target IP and Port
  3. Save and apply.

---

### VPN Configuration

#### OpenVPN:
1. **Create CA and Certificates**:
   - **System → Trust → Authorities/Certificates**.

2. **Configure OpenVPN Server**:
   - Navigate to **VPN → OpenVPN → Servers**.
   - Define settings (protocol, port, encryption).

3. **Export Clients**:
   - Use **VPN → OpenVPN → Client Export**.

#### WireGuard:
1. Install WireGuard plugin:
   - **System → Firmware → Plugins** → Install `os-wireguard`.
2. Configure peers and keys under **VPN → WireGuard**.

---

### Backup and Restore

- **Backup Configuration**:
  - Navigate to **System → Configuration → Backups**.
  - Download XML backup file.

- **Restore Configuration**:
  - Upload XML backup in the same menu.

- **Automated Backups**:
  - Use cloud providers (Google Drive, Nextcloud).

---

### Monitoring and Logs

1. **Real-time Traffic**:
   - **Interfaces → Overview**.
   - Use graphs for visual monitoring.

2. **View Logs**:
   - **System → Log Files**.
   - Logs are categorized (Firewall, DHCP, VPN).

3. **Enable IDS/IPS**:
   - **Services → Intrusion Detection**.
   - Enable rules and set actions (alert/block).

---

### Web Interface Guide

The web interface is the heart of OPNsense, offering intuitive configuration options.

1. **Dashboard**:
   - Overview of system health (CPU, memory, traffic).
   - Customize widgets as needed.

2. **Navigation Menu**:
   - Left-hand sidebar for system, firewall, VPN, and more.

3. **Search Bar**:
   - Quickly locate settings or logs.

4. **Advanced Tools**:
   - Access diagnostics: **System → Diagnostics**.
   - Execute commands in the shell: **System → Shell**.

5. **Theme Customization**:
   - **System → Settings → General** → Choose themes.

---

### Additional Resources

- [Official Documentation](https://docs.opnsense.org/)
- [Community Forums](https://forum.opnsense.org/)
- [GitHub Repository](https://github.com/opnsense/core)
