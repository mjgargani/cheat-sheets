# Visual Studio Code Cheat Sheet

Visual Studio Code (VS Code) is a lightweight, powerful, and extensible source-code editor that supports multiple programming languages. It provides built-in tools for debugging, version control, and remote development, making it an indispensable tool for developers.

## Table of Contents

1. [Introduction](#introduction)
2. [Installation and Setup](#installation-and-setup)
3. [Remote Development with SSH](#remote-development-with-ssh)
4. [VS Code Server Management](#vs-code-server-management)
5. [SSH Key Authentication](#ssh-key-authentication)
6. [Extensions in VS Code Server](#extensions-in-vs-code-server)
7. [Common Issue Fixes](#common-issue-fixes)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

## Introduction

Visual Studio Code is designed to provide a seamless coding experience. It supports an extensive range of programming languages and offers numerous extensions through the Marketplace. Key features include:

- **Extensibility**: Thousands of extensions to enhance functionality.
- **Remote Development**: Native support for SSH, Docker, and WSL.
- **Cross-Platform Compatibility**: Available for Windows, macOS, and Linux.

More information: [VS Code Official Documentation](https://code.visualstudio.com/).

---

## Installation and Setup

**Installing VS Code on a Local Machine**:

```bash
sudo apt update
sudo apt install code  # Alternatively, download from https://code.visualstudio.com/
```

**Installing VS Code Server on a Remote Machine**:

```bash
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

---

## Remote Development with SSH

**Configuring SSH**:

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

**Connecting to a Remote Server**:

```bash
code --remote ssh-remote+myserver
```

---

## VS Code Server Management

- **Updating the VS Code Server**:

```bash
code --remote ssh-remote+myserver --force-update
```

- **Starting or Stopping the VS Code Server Manually**:

```bash
~/.vscode-server/bin/<commit_id>/server.sh &
```

---

## SSH Key Authentication

Using SSH keys enhances the security of remote connections.

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

Extensions enhance the capabilities of the VS Code Server:

- **Install Extensions Remotely**:

```bash
code --remote ssh-remote+myserver --install-extension <extension_name>
```

- **List Installed Extensions**:

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

## Deprecated Features

Deprecated features and commands can be found in the [release notes](https://code.visualstudio.com/updates/). For instance, older configurations may be replaced by newer methods, such as the introduction of native SSH support.

---

## Additional References

- [VS Code Official Documentation](https://code.visualstudio.com/)
- [VS Code Marketplace](https://marketplace.visualstudio.com/)
