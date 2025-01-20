# Computer Networks Cheat Sheet: Advanced Concepts and OSI Model

Understanding computer networks is essential for modern IT systems. This cheat sheet delves into advanced networking concepts and the OSI (Open Systems Interconnection) model, providing a comprehensive guide for both theoretical and practical applications.

## Table of Contents

1. [Introduction](#introduction)
2. [OSI Model](#osi-model)
   - [Layers and Their Functions](#layers-and-their-functions)
   - [Comparison with the TCP/IP Model](#comparison-with-the-tcpip-model)
3. [Advanced Concepts](#advanced-concepts)
   - [Subnets and Masks](#subnets-and-masks)
   - [Routing and Protocols](#routing-and-protocols)
   - [Network Security](#network-security)
4. [References](#references)

---

## Introduction

The OSI model provides a theoretical framework for understanding how communication between systems occurs. It defines seven layers, each with distinct responsibilities. While it is not implemented directly, the OSI model is critical for learning networking principles, troubleshooting, and comparing with the TCP/IP model, which is widely used in practice.

---

## OSI Model

### Layers and Their Functions

1. **Physical Layer**: Defines electrical and physical specifications for devices, including cables, connectors, and signaling.
2. **Data Link Layer**: Provides reliable data transfer between adjacent nodes, handling framing and error detection. Example: Ethernet.
3. **Network Layer**: Manages addressing, routing, and forwarding. Example: Internet Protocol (IP).
4. **Transport Layer**: Ensures reliable data transmission end-to-end. Examples: TCP and UDP.
5. **Session Layer**: Controls sessions between applications, ensuring proper initialization and termination.
6. **Presentation Layer**: Converts data formats for compatibility between systems. Example: Encryption, ASCII to binary.
7. **Application Layer**: Interfaces directly with the user through services such as HTTP, FTP, and email protocols.

### Comparison with the TCP/IP Model

| OSI Model          | TCP/IP Model        |
|--------------------|---------------------|
| 7. Application     | Application         |
| 6. Presentation    | (Integrated in Application) |
| 5. Session         | (Integrated in Application) |
| 4. Transport       | Transport           |
| 3. Network         | Internet            |
| 2. Data Link       | Network Access      |
| 1. Physical        | Network Access      |

---

## Advanced Concepts

### Subnets and Masks

Subnets allow networks to be divided into smaller, manageable sections.

- **Subnet Mask**: Determines which portion of an IP address identifies the network and host. Example:
  - IP Address: `192.168.1.1`
  - Subnet Mask: `255.255.255.0`
  - CIDR Notation: `/24`

### Routing and Protocols

Routing involves forwarding data packets between networks.

- **Static Routing**: Manually configured paths.
- **Dynamic Routing Protocols**:
  - **RIP**: A simple protocol, suitable for small networks but limited to 15 hops.
  - **OSPF**: Uses link-state information for efficient routing within large networks.
  - **BGP**: The backbone protocol of the Internet, enabling routing between autonomous systems.

### Network Security

- **Firewalls**: Monitor and control incoming and outgoing traffic. Examples include `iptables` (Linux) and Defender Firewall (Windows).
- **VPNs (Virtual Private Networks)**: Secure data transmission over public networks by creating encrypted tunnels.
- **Intrusion Detection and Prevention Systems (IDS/IPS)**:
  - **IDS**: Detects malicious activity.
  - **IPS**: Prevents detected threats.

---

## References

- Andrew S. Tanenbaum, **Computer Networks**, 5th Edition, Pearson, 2010.
- Cisco Systems, [OSI Model Overview](https://www.cisco.com/).
- Red Hat, [Network Security and Firewall](https://www.redhat.com/).
- Linux Foundation, [Networking Standards](https://www.linuxfoundation.org/).
