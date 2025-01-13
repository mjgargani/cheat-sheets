# Estrutura de Pastas no Linux (Ubuntu-Based)

## Sumário

1. [Introdução](#introducao)
2. [Estrutura de Diretórios](#estrutura-de-diretorios)
   - [/](#raiz)
   - [/bin](#bin)
   - [/boot](#boot)
   - [/dev](#dev)
   - [/etc](#etc)
   - [/home](#home)
   - [/lib e /lib64](#lib-e-lib64)
   - [/media e /mnt](#media-e-mnt)
   - [/opt](#opt)
   - [/proc](#proc)
   - [/root](#root)
   - [/sbin](#sbin)
   - [/tmp](#tmp)
   - [/usr](#usr)
   - [/var](#var)
3. [Conceitos Avançados](#conceitos-avancados)
   - [Sistemas de Arquivos Virtuais](#sistemas-de-arquivos-virtuais)
   - [Pontos de Montagem](#pontos-de-montagem)
4. [Referências](#referencias)

---

## 1. Introdução

O Linux organiza seus arquivos e diretórios em uma hierarquia bem definida, começando pelo diretório raiz (`/`). Este guia explica a estrutura de pastas padrão encontrada em sistemas baseados em Ubuntu.

---

## 2. Estrutura de Diretórios

### /
O diretório raiz que contém todos os outros diretórios. Ele é o topo da hierarquia de arquivos.

---

### /bin
Contém binários essenciais, como comandos básicos que podem ser usados por todos os usuários. Exemplo:
```bash
/bin/ls
/bin/cp
```

---

### /boot
Contém arquivos necessários para inicializar o sistema, como o kernel e o bootloader (ex.: GRUB). Exemplos:
```bash
/boot/vmlinuz
/boot/initrd.img
```

---

### /dev
Armazena arquivos especiais que representam dispositivos de hardware. Exemplo:
```bash
/dev/sda1  # Partição do disco
/dev/null  # Dispositivo nulo
```

---

### /etc
Contém arquivos de configuração do sistema. Exemplo:
```bash
/etc/fstab  # Configuração de pontos de montagem
/etc/hosts  # Mapeamento de IPs e nomes de host
```

---

### /home
Contém os diretórios pessoais dos usuários. Exemplo:
```bash
/home/usuario
```

---

### /lib e /lib64
Contém bibliotecas compartilhadas necessárias para os binários em `/bin` e `/sbin`. Exemplos:
```bash
/lib/x86_64-linux-gnu/libc.so.6
```

---

### /media e /mnt
- `/media`: Pontos de montagem para dispositivos removíveis (pendrives, CDs).
- `/mnt`: Usado para montar sistemas de arquivos temporários.

---

### /opt
Armazena softwares opcionais instalados manualmente. Exemplo:
```bash
/opt/google/chrome
```

---

### /proc
Sistema de arquivos virtual que fornece informações sobre processos e o kernel. Exemplo:
```bash
/proc/cpuinfo  # Informações sobre a CPU
/proc/meminfo  # Informações sobre a memória
```

---

### /root
Diretório home do usuário root (administrador).

---

### /sbin
Contém binários essenciais para administração do sistema, como comandos para usuários root. Exemplo:
```bash
/sbin/reboot
```

---

### /tmp
Diretório para arquivos temporários. Dados armazenados aqui podem ser excluídos automaticamente.

---

### /usr
Armazena aplicativos e arquivos de uso geral. Subdiretórios comuns incluem:
- `/usr/bin`: Binários de aplicativos.
- `/usr/lib`: Bibliotecas.
- `/usr/share`: Arquivos compartilhados (ex.: manuais).

---

### /var
Contém dados variáveis, como logs e filas de impressão. Exemplo:
```bash
/var/log/syslog  # Logs do sistema
```

---

## 3. Conceitos Avançados

### Sistemas de Arquivos Virtuais

No Linux, diretórios como `/proc` e `/sys` são virtuais e não armazenam dados em discos. Eles fornecem informações dinâmicas sobre o sistema em tempo real.

### Pontos de Montagem

Um ponto de montagem é o local onde um sistema de arquivos é acessado. Exemplos:
- Partições adicionais podem ser montadas em `/mnt/dados`.
- Pendrives são automaticamente montados em `/media/usuario/dispositivo`.

---

## 4. Referências

- The Linux Documentation Project. [Filesystem Hierarchy Standard](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/). Acesso em 12/01/2025.
- Ubuntu Docs. [Linux Directory Structure](https://ubuntu.com/tutorials/directory-structure). Acesso em 12/01/2025.
- Nemeth, E. **UNIX and Linux System Administration Handbook**. Pearson, 2017.
