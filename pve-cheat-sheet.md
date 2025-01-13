# Proxmox VE Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet cobre comandos essenciais e práticas recomendadas para gerenciar ambientes Proxmox VE (Virtual Environment), uma plataforma de virtualização de código aberto baseada em Debian. Baseado na versão mais recente, fornece abstrações pedagógicas e instruções claras.

## Índice (pt-BR)

1. [O que é o Proxmox VE?](#o-que-e-o-proxmox-ve)
2. [Instalação](#instalacao)
3. [Gerenciamento de Rede](#gerenciamento-de-rede)
4. [Gerenciamento de VMs](#gerenciamento-de-vms)
5. [Gerenciamento de Containers (LXC)](#gerenciamento-de-containers-lxc)
6. [Gerenciamento de Armazenamento](#gerenciamento-de-armazenamento)
7. [Backup e Restauração](#backup-e-restauracao)
8. [Recursos Depreciados](#recursos-depreciados)
9. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is Proxmox VE?](#what-is-proxmox-ve)
2. [Installation](#installation)
3. [Network Management](#network-management)
4. [VM Management](#vm-management)
5. [Container (LXC) Management](#container-lxc-management)
6. [Storage Management](#storage-management)
7. [Backup and Restore](#backup-and-restore)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

### O que é o Proxmox VE? (pt-BR)

Proxmox VE é uma plataforma de virtualização baseada em Debian, oferecendo suporte para máquinas virtuais (KVM) e containers (LXC). Ele é amplamente utilizado em ambientes de produção por sua flexibilidade, interface web intuitiva e ferramentas integradas para backup e gerenciamento de clusters.

- **Suporte a VMs e Containers**: Combina KVM e LXC.
- **Interface Web**: Gerenciamento simplificado.
- **Recursos Integrados**: Backups, alta disponibilidade e clusterização.

Mais informações: [Proxmox VE Oficial](https://www.proxmox.com/).

### What is Proxmox VE? (en-US)

Proxmox VE is a Debian-based virtualization platform supporting virtual machines (KVM) and containers (LXC). It is widely used in production environments for its flexibility, intuitive web interface, and integrated tools for backup and cluster management.

- **VM and Container Support**: Combines KVM and LXC.
- **Web Interface**: Simplified management.
- **Integrated Features**: Backups, high availability, and clustering.

More information: [Proxmox VE Official](https://www.proxmox.com/).

---

### Instalação (pt-BR)

1. **Baixe a ISO**: [Proxmox VE Downloads](https://www.proxmox.com/en/downloads).
2. **Prepare o Instalador**:

```bash
# Atualize o sistema antes de instalar o Proxmox VE
apt update && apt full-upgrade -y

# Instale o Proxmox VE
apt install proxmox-ve postfix open-iscsi -y

# Remova pacotes conflitantes
apt remove os-prober

# Reinicie após a instalação
reboot
```

### Installation (en-US)

1. **Download the ISO**: [Proxmox VE Downloads](https://www.proxmox.com/en/downloads).
2. **Prepare the Installer**:

```bash
# Update the system before installing Proxmox VE
apt update && apt full-upgrade -y

# Install Proxmox VE
apt install proxmox-ve postfix open-iscsi -y

# Remove conflicting packages
apt remove os-prober

# Reboot after installation
reboot
```

---

### Gerenciamento de Rede (pt-BR)

- **Exibir interfaces de rede**:

```bash
ip a
```

- **Configurar IP Estático (modo bridge)**:

```bash
nano /etc/network/interfaces

# Exemplo de configuração
auto vmbr0
iface vmbr0 inet static
    address 192.168.1.10/24
    gateway 192.168.1.1
    bridge_ports enp0s31f6
    bridge_stp off
    bridge_fd 0
```

- **Aplicar alterações**:

```bash
systemctl restart networking
```

### Network Management (en-US)

- **Show network interfaces**:

```bash
ip a
```

- **Configure Static IP (bridge mode)**:

```bash
nano /etc/network/interfaces

# Configuration example
auto vmbr0
iface vmbr0 inet static
    address 192.168.1.10/24
    gateway 192.168.1.1
    bridge_ports enp0s31f6
    bridge_stp off
    bridge_fd 0
```

- **Apply changes**:

```bash
systemctl restart networking
```

---

### Gerenciamento de VMs (pt-BR)

- **Criar uma VM**:

```bash
qm create 100 --name ubuntu-server --memory 4096 --net0 virtio,bridge=vmbr0 --cores 2 --cpu host
```

- **Iniciar uma VM**:

```bash
qm start 100
```

- **Parar uma VM**:

```bash
qm stop 100
```

### VM Management (en-US)

- **Create a VM**:

```bash
qm create 100 --name ubuntu-server --memory 4096 --net0 virtio,bridge=vmbr0 --cores 2 --cpu host
```

- **Start a VM**:

```bash
qm start 100
```

- **Stop a VM**:

```bash
qm stop 100
```

---

### Backup e Restauração (pt-BR)

- **Backup de VM**:

```bash
vzdump 100 --storage local --compress zstd --dumpdir /var/lib/vz/dump/
```

- **Restaurar uma VM**:

```bash
qmrestore /var/lib/vz/dump/vzdump-qemu-100-YYYY_MM_DD-HH_mm_ss.vma.zst 200
```

### Backup and Restore (en-US)

- **VM Backup**:

```bash
vzdump 100 --storage local --compress zstd --dumpdir /var/lib/vz/dump/
```

- **Restore a VM**:

```bash
qmrestore /var/lib/vz/dump/vzdump-qemu-100-YYYY_MM_DD-HH_mm_ss.vma.zst 200
```

---

### Recursos Depreciados (pt-BR)

Consulte os comandos obsoletos na [documentação oficial](https://pve.proxmox.com/wiki/Main_Page).

### Deprecated Features (en-US)

Refer to deprecated commands in the [official documentation](https://pve.proxmox.com/wiki/Main_Page).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do Proxmox VE](https://pve.proxmox.com/)
- [Fórum da Comunidade Proxmox](https://forum.proxmox.com/)

### Additional References (en-US)

- [Proxmox VE Official Documentation](https://pve.proxmox.com/)
- [Proxmox Community Forum](https://forum.proxmox.com/)
