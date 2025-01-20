# Visual Studio Code Server Cheat Sheet

Visual Studio Code Server (VS Code Server) is a core component of Visual Studio Code that enables remote development by running in the background on remote servers. This cheat sheet provides essential commands and troubleshooting tips for configuring and using VS Code Server effectively.

## Table of Contents

1. [Introduction](#introduction)
2. [Installation and Setup](#installation-and-setup)
3. [SSH Configuration](#ssh-configuration)
4. [Connecting to Remote Server](#connecting-to-remote-server)
5. [VS Code Server Management](#vs-code-server-management)
6. [SSH Key Authentication](#ssh-key-authentication)
7. [Extensions in VS Code Server](#extensions-in-vs-code-server)
8. [Common Issue Fixes](#common-issue-fixes)
9. [Additional References](#additional-references)

---

## Introduction

VS Code Server is designed to enhance remote development workflows by providing the same development experience as local Visual Studio Code installations. Key features include:

- **Simplified Remote Development**: Seamlessly work on remote servers using the VS Code interface.
- **Secure Connections**: Utilize SSH for fast and secure communication.
- **Extension Support**: Install and manage extensions directly on the remote server.

More information: [VS Code Server Documentation](https://code.visualstudio.com/docs/remote/remote-overview).

---

## Installation and Setup

**Install VS Code Server on a Remote Server**:

```bash
# Run this from your local machine
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

---

## SSH Configuration

**Edit SSH Configuration**:

```bash
nano ~/.ssh/config
```

**Example Configuration**:

```ini
Host myserver
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/id_rsa
```

---

## Connecting to Remote Server

**Connect to a Remote Server**:

```bash
code --remote ssh-remote+myserver
```

---

## VS Code Server Management

- **Update VS Code Server**:

```bash
code --remote ssh-remote+myserver --force-update
```

- **Stop VS Code Server**:

```bash
pkill -f vscode-server
```

---

## SSH Key Authentication

Using SSH keys enhances security for remote development.

1. **Generate SSH Key Pair**:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

2. **Copy Public Key to Remote Server**:

```bash
ssh-copy-id username@remote-host
```

---

## Extensions in VS Code Server

**Install Extensions Remotely**:

```bash
code --install-extension <extension-id> --remote ssh-remote+myserver
```

**List Installed Extensions**:

```bash
code --list-extensions
```

---

## Common Issue Fixes

- **VS Code Server Not Starting**:

```bash
rm -rf ~/.vscode-server/bin && rm -rf ~/.vscode-server-insiders/bin
```

---

## Additional References

- [VS Code Server Official Documentation](https://code.visualstudio.com/docs/remote/remote-overview)
- [VS Code GitHub Repository](https://github.com/microsoft/vscode)
