# Servidores de Arquivos no Windows

## Sumário

1. [Introdução](#introducao)
2. [Configuração Básica](#configuracao-basica)
   - [Habilitando o Compartilhamento de Arquivos](#habilitando-o-compartilhamento-de-arquivos)
   - [Permissões de Acesso](#permissoes-de-acesso)
3. [Conceitos Avançados](#conceitos-avancados)
   - [Configuração de um Servidor de Arquivos via Active Directory](#configuracao-de-um-servidor-de-arquivos-via-active-directory)
   - [Gerenciamento de Cotas de Disco](#gerenciamento-de-cotas-de-disco)
   - [Acesso Remoto e DFS](#acesso-remoto-e-dfs)
4. [Referências](#referencias)

---

## 1. Introdução

Os servidores de arquivos no Windows permitem o armazenamento centralizado de dados, gerenciamento de permissões e compartilhamento eficiente. Este guia aborda desde configurações básicas até recursos avançados.

---

## 2. Configuração Básica

### Habilitando o Compartilhamento de Arquivos

1. **Instalando a Função de Servidor de Arquivos**:
   - Acesse o **Server Manager**.
   - Clique em "Add Roles and Features".
   - Selecione "File and Storage Services" e habilite o recurso "File Server".

2. **Configurando um Compartilhamento Simples**:
   - Clique com o botão direito na pasta desejada e selecione "Properties".
   - Vá até a aba "Sharing" e clique em "Advanced Sharing".
   - Habilite "Share this folder" e configure permissões.

### Permissões de Acesso

1. **Permissões de Compartilhamento**:
   - Configuradas na aba "Sharing".
   - Exemplos: "Full Control", "Change", "Read".

2. **Permissões NTFS**:
   - Configuradas na aba "Security".
   - Permissões mais detalhadas, como "Write" ou "Modify".

3. **Combinação de Permissões**:
   - A permissão efetiva é a mais restritiva entre o compartilhamento e o NTFS.

---

## 3. Conceitos Avançados

### Configuração de um Servidor de Arquivos via Active Directory

1. **Integração com AD**:
   - Crie grupos de segurança no AD para facilitar o gerenciamento de permissões.
   - Atribua permissões aos grupos em vez de usuários individuais.

2. **Perfis de Usuário Centralizados**:
   - Configure "Home Folders" para armazenar dados de perfil em servidores centralizados.

### Gerenciamento de Cotas de Disco

1. **Habilitando Cotas**:
   - Acesse o **File Server Resource Manager**.
   - Configure cotas por volume ou pasta.

2. **Exemplo de Política**:
   - Limitar cada usuário a 10 GB de armazenamento.

### Acesso Remoto e DFS

1. **Configuração de Acesso Remoto**:
   - Use o recurso **Remote Desktop Services** ou **VPN** para conexões seguras.

2. **DFS (Distributed File System)**:
   - Crie um namespace unificado para simplificar o acesso a múltiplos servidores.
   - Configuração via **DFS Management**.

---

## 4. Referências

- Microsoft Docs. [Gerenciamento de Servidores de Arquivos](https://docs.microsoft.com/pt-br/windows-server/storage/file-server/). Acesso em 12/01/2025.
- Peterson, R. **Windows Server Administration**. Pearson, 2020.

---

# File Servers on Windows

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

File servers on Windows enable centralized data storage, permission management, and efficient sharing. This guide covers basic setups and advanced features.

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
   - Examples: "Full Control," "Change," "Read."

2. **NTFS Permissions**:
   - Configured under the "Security" tab.
   - More granular permissions, like "Write" or "Modify."

3. **Effective Permissions**:
   - The most restrictive setting between Sharing and NTFS applies.

---

## 3. Advanced Concepts

### Configuring a File Server via Active Directory

1. **AD Integration**:
   - Create security groups in AD for easier permission management.
   - Assign permissions to groups instead of individual users.

2. **Centralized User Profiles**:
   - Configure "Home Folders" to store profile data on centralized servers.

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

- Microsoft Docs. [File Server Management](https://docs.microsoft.com/en-us/windows-server/storage/file-server/). Accessed on 01/12/2025.
- Peterson, R. **Windows Server Administration**. Pearson, 2020.
