# Servidores de Arquivos no Linux

## Sumário

1. [Introdução](#introducao)
2. [Configuração Básica](#configuracao-basica)
   - [Configuração do Samba](#configuracao-do-samba)
   - [Permissões de Arquivo](#permissoes-de-arquivo)
3. [Conceitos Avançados](#conceitos-avancados)
   - [NFS (Network File System)](#nfs-network-file-system)
   - [Gerenciamento de Permissões Avançadas com ACL](#gerenciamento-de-permissoes-avancadas-com-acl)
   - [Monitoramento e Logs](#monitoramento-e-logs)
4. [Referências](#referencias)

---

## 1. Introdução

Servidores de arquivos no Linux oferecem flexibilidade e controle para compartilhamento de dados. Ferramentas como Samba e NFS são amplamente utilizadas, e a gestão de permissões garante segurança.

---

## 2. Configuração Básica

### Configuração do Samba

1. **Instalação do Samba**:
   ```bash
   sudo apt update
   sudo apt install samba
   ```

2. **Configuração do Arquivo smb.conf**:
   - Localização padrão: `/etc/samba/smb.conf`.
   - Exemplo de compartilhamento simples:
     ```
     [public]
     path = /srv/samba/public
     browsable = yes
     writable = yes
     guest ok = yes
     ```

3. **Reiniciando o Serviço**:
   ```bash
   sudo systemctl restart smbd
   ```

4. **Adicionando Usuários ao Samba**:
   ```bash
   sudo smbpasswd -a nome_do_usuario
   ```

### Permissões de Arquivo

1. **Definição de Permissões**:
   - Exemplo de permissões padrão para um diretório compartilhado:
     ```bash
     sudo chmod 770 /srv/samba/public
     sudo chown nobody:nogroup /srv/samba/public
     ```

2. **Combinação de Permissões Samba e Linux**:
   - O acesso final combina permissões do Samba e do sistema de arquivos Linux.

---

## 3. Conceitos Avançados

### NFS (Network File System)

1. **Instalação do Servidor NFS**:
   ```bash
   sudo apt update
   sudo apt install nfs-kernel-server
   ```

2. **Configuração do Arquivo /etc/exports**:
   - Exemplo:
     ```
     /srv/nfs 192.168.1.0/24(rw,sync,no_subtree_check)
     ```

3. **Reiniciando o Serviço**:
   ```bash
   sudo systemctl restart nfs-kernel-server
   ```

### Gerenciamento de Permissões Avançadas com ACL

1. **Habilitando ACL no Sistema de Arquivos**:
   ```bash
   sudo mount -o remount,acl /srv
   ```

2. **Definindo ACLs**:
   ```bash
   sudo setfacl -m u:usuario:rwx /srv/samba/public
   sudo getfacl /srv/samba/public
   ```

### Monitoramento e Logs

1. **Log do Samba**:
   - Local: `/var/log/samba/`.

2. **Monitoramento em Tempo Real**:
   ```bash
   tail -f /var/log/samba/log.smbd
   ```

3. **Ferramentas Úteis**:
   - `smbstatus`: Visualizar conexões ativas.

---

## 4. Referências

- Debian Wiki. [Samba](https://wiki.debian.org/Samba). Acesso em 12/01/2025.
- Linux NFS. [Documentação Oficial](http://nfs.sourceforge.net/). Acesso em 12/01/2025.
- Peterson, R. **Linux Server Administration**. Pearson, 2020.

---

# File Servers on Linux

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

Linux file servers provide flexibility and control for data sharing. Tools like Samba and NFS are widely used, and permission management ensures security.

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

- Debian Wiki. [Samba](https://wiki.debian.org/Samba). Accessed on 01/12/2025.
- Linux NFS. [Official Documentation](http://nfs.sourceforge.net/). Accessed on 01/12/2025.
- Peterson, R. **Linux Server Administration**. Pearson, 2020.
