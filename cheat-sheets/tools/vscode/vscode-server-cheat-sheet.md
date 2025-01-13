# Visual Studio Code Server Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet aborda a configuração e o uso do Visual Studio Code Server para desenvolvimento remoto. Baseado nas últimas versões, fornece instruções claras e soluções para problemas comuns.

## Índice (pt-BR)

1. [O que é o VS Code Server?](#o-que-e-o-vs-code-server)
2. [Instalação e Configuração](#instalacao-e-configuracao)
3. [Configuração do SSH](#configuracao-do-ssh)
4. [Conexão com o Servidor Remoto](#conexao-com-o-servidor-remoto)
5. [Gerenciamento do VS Code Server](#gerenciamento-do-vs-code-server)
6. [Autenticação com Chaves SSH](#autenticacao-com-chaves-ssh)
7. [Extensões no VS Code Server](#extensoes-no-vs-code-server)
8. [Soluções de Problemas Comuns](#solucoes-de-problemas-comuns)
9. [Recursos Depreciados](#recursos-depreciados)
10. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is VS Code Server?](#what-is-vs-code-server)
2. [Installation and Setup](#installation-and-setup)
3. [SSH Configuration](#ssh-configuration)
4. [Connecting to Remote Server](#connecting-to-remote-server)
5. [VS Code Server Management](#vs-code-server-management)
6. [SSH Key Authentication](#ssh-key-authentication)
7. [Extensions in VS Code Server](#extensions-in-vs-code-server)
8. [Common Issue Fixes](#common-issue-fixes)
9. [Deprecated Features](#deprecated-features)
10. [Additional References](#additional-references)

---

### O que é o VS Code Server? (pt-BR)

VS Code Server é um componente do Visual Studio Code que permite o desenvolvimento remoto. Ele funciona em segundo plano em servidores remotos, fornecendo a mesma experiência de desenvolvimento que o VS Code local.

- **Desenvolvimento Remoto Simplificado**: Acesse servidores remotos com uma interface familiar.
- **Compatível com SSH**: Conexões seguras e rápidas via SSH.
- **Gerenciamento de Extensões**: Instale extensões diretamente no servidor remoto.

Mais informações: [VS Code Server Docs](https://code.visualstudio.com/docs/remote/remote-overview).

### What is VS Code Server? (en-US)

VS Code Server is a component of Visual Studio Code enabling remote development. It runs in the background on remote servers, providing the same development experience as local VS Code.

- **Simplified Remote Development**: Access remote servers with a familiar interface.
- **SSH Compatible**: Secure and fast connections via SSH.
- **Extension Management**: Install extensions directly on the remote server.

More information: [VS Code Server Docs](https://code.visualstudio.com/docs/remote/remote-overview).

---

### Instalação e Configuração (pt-BR)

**Instalar o VS Code Server em um Servidor Remoto**:

```bash
# Execute do local para instalar no remoto
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

### Installation and Setup (en-US)

**Install VS Code Server on a Remote Server**:

```bash
# Run from local to install on remote
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

---

### Configuração do SSH (pt-BR)

**Editar Configuração SSH**:

```bash
nano ~/.ssh/config
```

**Exemplo de Configuração**:

```ini
Host myserver
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/id_rsa
```

### SSH Configuration (en-US)

**Edit SSH Configuration**:

```bash
nano ~/.ssh/config
```

**Configuration Example**:

```ini
Host myserver
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/id_rsa
```

---

### Conexão com o Servidor Remoto (pt-BR)

**Conectar ao Servidor Remoto**:

```bash
code --remote ssh-remote+myserver
```

### Connecting to Remote Server (en-US)

**Connect to Remote Server**:

```bash
code --remote ssh-remote+myserver
```

---

### Gerenciamento do VS Code Server (pt-BR)

**Atualizar o VS Code Server**:

```bash
code --remote ssh-remote+myserver --force-update
```

**Parar o VS Code Server**:

```bash
pkill -f vscode-server
```

### VS Code Server Management (en-US)

**Update VS Code Server**:

```bash
code --remote ssh-remote+myserver --force-update
```

**Stop VS Code Server**:

```bash
pkill -f vscode-server
```

---

### Extensões no VS Code Server (pt-BR)

**Instalar Extensões Remotas**:

```bash
code --install-extension <extension-id> --remote ssh-remote+myserver
```

### Extensions in VS Code Server (en-US)

**Install Remote Extensions**:

```bash
code --install-extension <extension-id> --remote ssh-remote+myserver
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

- [Documentação Oficial do VS Code Server](https://code.visualstudio.com/docs/remote/remote-overview)
- [Fórum do VS Code](https://github.com/microsoft/vscode)

### Additional References (en-US)

- [VS Code Server Official Documentation](https://code.visualstudio.com/docs/remote/remote-overview)
- [VS Code Forum](https://github.com/microsoft/vscode)
