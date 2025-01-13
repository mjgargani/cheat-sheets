# Visual Studio Code Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet cobre como instalar, configurar e usar o Visual Studio Code, incluindo o VS Code Server para desenvolvimento remoto. Baseado nas últimas versões, fornece instruções claras e práticas.

## Índice (pt-BR)

1. [O que é o Visual Studio Code?](#o-que-e-o-visual-studio-code)
2. [Instalação e Configuração](#instalacao-e-configuracao)
3. [Desenvolvimento Remoto com SSH](#desenvolvimento-remoto-com-ssh)
4. [Gerenciamento do VS Code Server](#gerenciamento-do-vs-code-server)
5. [Autenticação com Chaves SSH](#autenticacao-com-chaves-ssh)
6. [Extensões no VS Code Server](#extensoes-no-vs-code-server)
7. [Soluções de Problemas Comuns](#solucoes-de-problemas-comuns)
8. [Recursos Depreciados](#recursos-depreciados)
9. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is Visual Studio Code?](#what-is-visual-studio-code)
2. [Installation and Setup](#installation-and-setup)
3. [Remote Development with SSH](#remote-development-with-ssh)
4. [VS Code Server Management](#vs-code-server-management)
5. [SSH Key Authentication](#ssh-key-authentication)
6. [Extensions in VS Code Server](#extensions-in-vs-code-server)
7. [Common Issue Fixes](#common-issue-fixes)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

### O que é o Visual Studio Code? (pt-BR)

Visual Studio Code é um editor de código-fonte leve, poderoso e extensível, suportando várias linguagens de programação. Ele oferece ferramentas integradas para depuração, controle de versão e desenvolvimento remoto.

- **Editor Extensível**: Milhares de extensões disponíveis no Marketplace.
- **Desenvolvimento Remoto**: Suporte integrado para SSH, Docker e WSL.
- **Multi-plataforma**: Disponível para Windows, macOS e Linux.

Mais informações: [Documentação Oficial do VS Code](https://code.visualstudio.com/).

### What is Visual Studio Code? (en-US)

Visual Studio Code is a lightweight, powerful, and extensible source-code editor supporting multiple programming languages. It provides built-in tools for debugging, version control, and remote development.

- **Extensible Editor**: Thousands of extensions available in the Marketplace.
- **Remote Development**: Built-in support for SSH, Docker, and WSL.
- **Cross-Platform**: Available for Windows, macOS, and Linux.

More information: [VS Code Official Documentation](https://code.visualstudio.com/).

---

### Instalação e Configuração (pt-BR)

**Instalar o VS Code em uma Máquina Local**:

```bash
sudo apt update
sudo apt install code  # Ou baixe o .deb/.rpm em https://code.visualstudio.com/
```

**Instalar o VS Code Server em uma Máquina Remota**:

```bash
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

### Installation and Setup (en-US)

**Install VS Code on a Local Machine**:

```bash
sudo apt update
sudo apt install code  # Or download the .deb/.rpm from https://code.visualstudio.com/
```

**Install VS Code Server on a Remote Machine**:

```bash
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

---

### Desenvolvimento Remoto com SSH (pt-BR)

**Configuração do SSH**:

```bash
nano ~/.ssh/config
```

**Exemplo**:

```ini
Host myserver
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/id_rsa
```

**Conectar ao Servidor Remoto**:

```bash
code --remote ssh-remote+myserver
```

### Remote Development with SSH (en-US)

**SSH Configuration**:

```bash
nano ~/.ssh/config
```

**Example**:

```ini
Host myserver
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/id_rsa
```

**Connect to Remote Server**:

```bash
code --remote ssh-remote+myserver
```

---

### Gerenciamento do VS Code Server (pt-BR)

- **Atualizar o VS Code Server**:

```bash
code --remote ssh-remote+myserver --force-update
```

- **Iniciar ou Parar o VS Code Server Manualmente**:

```bash
~/.vscode-server/bin/<commit_id>/server.sh &
```

### VS Code Server Management (en-US)

- **Update VS Code Server**:

```bash
code --remote ssh-remote+myserver --force-update
```

- **Start or Stop VS Code Server Manually**:

```bash
~/.vscode-server/bin/<commit_id>/server.sh &
```

---

### Soluções de Problemas Comuns (pt-BR)

- **VS Code Server não inicia**:

```bash
rm -rf ~/.vscode-server/bin && rm -rf ~/.vscode-server-insiders/bin
```

### Common Issue Fixes (en-US)

- **VS Code Server not starting**:

```bash
rm -rf ~/.vscode-server/bin && rm -rf ~/.vscode-server-insiders/bin
```

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do VS Code](https://code.visualstudio.com/)
- [Extensões Remotas no Marketplace](https://marketplace.visualstudio.com/VSCode)

### Additional References (en-US)

- [VS Code Official Documentation](https://code.visualstudio.com/)
- [Remote Extensions on the Marketplace](https://marketplace.visualstudio.com/VSCode)
