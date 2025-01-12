# Visual Studio Code Server Cheat Sheet (2024)

---

## 1. **Installation & Setup**

### **1.1 Install VS Code (Local Machine):**
```bash
sudo apt update
sudo apt install code  # or download .deb/.rpm from https://code.visualstudio.com/
```

### **1.2 Install VS Code Server (Remote Machine):**
```bash
# Run this from the local machine
code --remote ssh-user@remote-host --install-extension ms-vscode-remote.remote-ssh
```

---

## 2. **Remote SSH (Remote Development)**

### **2.1 SSH Configuration:**
```bash
# Edit SSH config for easy access
nano ~/.ssh/config
```
**Example:**
```ini
Host myserver
    HostName 192.168.1.100
    User username
    IdentityFile ~/.ssh/id_rsa
```

### **2.2 Connect to Remote Server:**
```bash
# Connect to remote server via VS Code
code --remote ssh-remote+myserver
```
OR via GUI:
- **Ctrl + Shift + P** ➝ `Remote-SSH: Connect to Host` ➝ Select `myserver`

### **2.3 Check Running VS Code Server on Remote:**
```bash
ps aux | grep vscode
```

### **2.4 Kill Running VS Code Server (Troubleshooting):**
```bash
vscode-server/bin/<commit_id>/bin/code-server --uninstall
```
OR
```bash
rm -rf ~/.vscode-server
```

---

## 3. **VS Code Server Management**

### **3.1 Update VS Code Server:**
```bash
code --remote ssh-remote+myserver --force-update
```

### **3.2 Start/Stop VS Code Server:**
```bash
# Start server manually
~/.vscode-server/bin/<commit_id>/server.sh &

# Stop running server
pkill -f vscode-server
```

### **3.3 Port Forwarding (Remote Server):**
```bash
ssh -L 8080:localhost:8080 user@remote-host
```
- **Access local app**: `http://localhost:8080`

---

## 4. **Extensions Management (Remote)**

### **4.1 Install Extensions (Remote):**
```bash
code --install-extension <extension-id> --remote ssh-remote+myserver
```

### **4.2 List Installed Extensions:**
```bash
code --list-extensions --show-versions
```

### **4.3 Remove Extensions:**
```bash
code --uninstall-extension <extension-id> --remote ssh-remote+myserver
```

---

## 5. **SSH Key Authentication**

### **5.1 Generate SSH Key (Local):**
```bash
ssh-keygen -t rsa -b 4096
```

### **5.2 Copy Public Key to Remote Server:**
```bash
ssh-copy-id user@remote-host
```
OR manually:
```bash
cat ~/.ssh/id_rsa.pub | ssh user@remote-host 'cat >> ~/.ssh/authorized_keys'
```

---

## 6. **Common Issues & Fixes**

### **6.1 VS Code Server Not Starting:**
```bash
rm -rf ~/.vscode-server/bin && rm -rf ~/.vscode-server-insiders/bin
```

### **6.2 Connection Timeout:**
```bash
# Add this to ~/.ssh/config
Host *
    ServerAliveInterval 60
```

### **6.3 Failed to Update VS Code Server:**
```bash
rm -rf ~/.vscode-server
```

### **6.4 Remote Server Out of Disk Space:**
```bash
# Clear unused extensions
rm -rf ~/.vscode-server/extensions
```

---

## 7. **VS Code Deprecations (2024)**

- **`--install-extension`**: Now requires `--remote` explicitly for remote installs.
- **`version` in `docker-compose.yml`**: Deprecated; use schema versioning.
- **`~/.vscode-server-insiders`**: Deprecated; replaced by `~/.vscode-server`.

---

## 8. **Advanced (SSH Tunnels & Custom Ports)**

### **8.1 Use Custom SSH Port:**
```bash
ssh -p 2222 user@remote-host
```

### **8.2 SSH Tunnel to Remote Service:**
```bash
ssh -L 3000:localhost:3000 user@remote-host
```

### **8.3 Access Docker Daemon on Remote Server (VS Code):**
```bash
ssh -L /var/run/docker.sock:/var/run/docker.sock user@remote-host
```

---

## 9. **Useful Shortcuts**
- **Reconnect to Remote:** `Ctrl + Shift + P` ➝ `Remote-SSH: Connect to Host`
- **Open Terminal on Remote:** `Ctrl + Shift + P` ➝ `Remote-SSH: Open Remote Terminal`
- **Remote Port Forwarding:** `Ctrl + Shift + P` ➝ `Remote-SSH: Forward Port`

