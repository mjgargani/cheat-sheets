# PowerShell no Linux Cheat-Sheet

## 1. Visão Geral

PowerShell é um shell de linha de comando e linguagem de script desenvolvidos originalmente para o Windows, mas agora é **cross-platform** (disponível também para Linux e macOS). Ele utiliza um pipeline baseado em objetos (diferente do pipeline de texto do Bash) e integra-se com o .NET, permitindo construir scripts e automações robustas e complexas.

---

## 2. Instalação

### 2.1 Usando o APT (para Ubuntu, Linux Mint, Debian)

> **Observação:** No Linux Mint 22 (baseado no Ubuntu 22.04), é importante especificar manualmente a versão na URL do repositório.

1. **Atualize a lista de pacotes e instale os pré-requisitos:**

   ```bash
   sudo apt-get update
   sudo apt-get install -y wget apt-transport-https software-properties-common
   ```

2. **Baixe e instale o pacote de repositório correto:**

   ```bash
   wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
   sudo dpkg -i packages-microsoft-prod.deb
   rm packages-microsoft-prod.deb
   ```

3. **Atualize novamente a lista de pacotes e instale o PowerShell:**

   ```bash
   sudo apt-get update
   sudo apt-get install -y powershell
   ```

4. **Inicie o PowerShell:**

   ```bash
   pwsh
   ```

### 2.2 Usando o Snap

Se preferir a instalação via Snap (que utiliza o confinamento *classic*):

```bash
sudo snap install powershell --classic
```

E para iniciar:

```bash
pwsh
```

> **Referências:**
> - [Installing PowerShell on Linux (Microsoft Official)](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.5)
> - [How to Install PowerShell on Ubuntu 22.04 or 20.04](https://linuxcapable.com/how-to-install-powershell-on-ubuntu-linux/)

---

## 3. Vantagens de Usar PowerShell no Linux

- **Consistência Cross-Platform:**  
  Use o mesmo conjunto de scripts e cmdlets tanto em ambientes Windows quanto Linux, facilitando a automação em ambientes heterogêneos.

- **Pipeline Baseado em Objetos:**  
  Ao contrário de shells nativos (como Bash) que trabalham com texto, o PowerShell transmite objetos completos entre cmdlets, o que melhora a precisão e a facilidade de manipulação de dados.

- **Integração com .NET:**  
  Permite o acesso direto a classes e métodos do .NET, ampliando significativamente as possibilidades de automação e criação de ferramentas.

- **Rico Ecossistema de Cmdlets e Módulos:**  
  Inclui cmdlets para gerenciamento de sistemas, manipulação de arquivos, processos, rede, e muito mais. Mesmo que alguns módulos sejam específicos do Windows, a comunidade e a Microsoft estão ampliando a compatibilidade para o Core.

- **Facilidade para Administradores:**  
  Especialmente útil para administradores que já estão familiarizados com PowerShell no Windows e querem unificar suas tarefas de administração em múltiplos sistemas.

---

## 4. Comparação com Scripts Nativos (Bash, etc.)

| Aspecto                     | PowerShell                                     | Bash (e outros shells nativos)         |
|-----------------------------|------------------------------------------------|----------------------------------------|
| **Pipeline**                | Baseado em objetos (retém tipos e propriedades) | Baseado em texto (necessita parse)     |
| **Sintaxe**                 | Cmdlets, funções e métodos do .NET integrados    | Comandos Unix clássicos e utilitários  |
| **Manipulação de Dados**    | Trabalha com coleções de objetos; fácil filtragem, ordenação e agrupamento | Manipulação via utilitários externos (awk, sed, grep) |
| **Integração**              | Forte integração com .NET e ambientes Windows    | Integrado ao ambiente Unix/Linux nativamente |
| **Modularidade**            | Módulos e repositórios oficiais (PowerShell Gallery) | Pacotes e scripts individuais          |

> **Vantagem:**  
> Para tarefas complexas que exigem manipulação de dados estruturados ou integração com APIs .NET, o PowerShell oferece uma abordagem mais robusta e orientada a objetos.

---

## 5. Diferenças: PowerShell no Linux vs. Windows

- **Disponibilidade de Módulos:**  
  - **Windows:** Muitos módulos nativos (ex.: *NetSecurity*, *PSDesiredStateConfiguration*) são integrados e funcionam sem adaptações.  
  - **Linux:** Alguns módulos específicos do Windows podem não funcionar ou requerer o uso de `-UseWindowsPowerShell` (através de remoting ou compatibilidade) ou ainda não estarem disponíveis.

- **Integração com o Sistema:**  
  - **Windows:** Acesso profundo a APIs do Windows, WMI e outros recursos exclusivos.  
  - **Linux:** Embora integrado ao ambiente Unix, o PowerShell pode não ter acesso direto a alguns recursos do sistema que já são nativos do shell Bash, exigindo adaptação.

- **Caminhos e Variáveis de Ambiente:**  
  - **Windows:** Localizações padrão como `%ProgramFiles%\PowerShell` e módulos nos diretórios do Windows PowerShell.  
  - **Linux:** Módulos e executáveis instalados em diretórios padrão do sistema Linux (ex.: `/usr/bin/pwsh`, `/usr/share/powershell`).

- **Instalação e Atualização:**  
  - **Windows:** Instalação via MSI, Microsoft Store ou via WinGet.  
  - **Linux:** Instalação via gerenciador de pacotes (APT, DNF, etc.) ou Snap. A experiência de instalação pode variar de acordo com a distribuição (veja detalhes na seção de instalação).

> **Nota:**  
> Apesar de ser uma solução da Microsoft, a versão open source do PowerShell (também conhecida como PowerShell Core) está em constante evolução e tem ganhado compatibilidade e melhorias para uso em sistemas Linux. As diferenças com a versão Windows são principalmente relacionadas à integração com os recursos nativos do sistema operacional.

---

## 6. Referências Oficiais

- [Installing PowerShell on Linux (Microsoft Official)](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.5)
- [PowerShell GitHub Repository](https://github.com/PowerShell/PowerShell)
- [PowerShell Documentation](https://docs.microsoft.com/powershell/)
- [How to Install PowerShell on Ubuntu 22.04 or 20.04](https://linuxcapable.com/how-to-install-powershell-on-ubuntu-linux/)

---

## 7. Exemplos Rápidos de Comandos

```powershell
# Exibir versão do PowerShell e ambiente
$PSVersionTable

# Listar comandos disponíveis
Get-Command

# Obter ajuda sobre um cmdlet
Get-Help Get-Process -Full

# Listar processos em execução
Get-Process

# Trabalhar com arquivos: criar, adicionar conteúdo e ler
New-Item -Path ./arquivo.txt -ItemType File
Set-Content -Path ./arquivo.txt -Value "Conteúdo exemplo"
Get-Content -Path ./arquivo.txt

# Listar diretórios e arquivos
Get-ChildItem

# Usar pipeline para filtrar dados
Get-Process | Where-Object {$_.CPU -gt 100}
```

---

Este cheat-sheet resume os pontos essenciais para instalar e usar o PowerShell no Linux, além de destacar as principais vantagens e diferenças em relação aos scripts nativos e à sua versão no Windows.

Se precisar de mais detalhes ou tiver dúvidas, consulte as referências oficiais acima.