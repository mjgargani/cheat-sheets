# Guia Completo de PowerShell no Windows 10 e 11

## Índice
1. [Introdução ao PowerShell](#introdução-ao-powershell)
2. [Instalação e Atualização do PowerShell](#instalação-e-atualização-do-powershell)
   - [Verificando a Versão do PowerShell](#verificando-a-versão-do-powershell)
   - [Instalando o PowerShell 7.x](#instalando-o-powershell-7x)
3. [Práticas Recomendadas](#práticas-recomendadas)
   - [Uso de Verbos Aprovados](#uso-de-verbos-aprovados)
   - [Comentários Instrutivos](#comentários-instrutivos)
   - [Tratamento de Erros](#tratamento-de-erros)
4. [Instalação de Software](#instalação-de-software)
   - [Usando o Windows Package Manager (winget)](#usando-o-windows-package-manager-winget)
   - [Usando o Chocolatey](#usando-o-chocolatey)
5. [Alteração de Políticas Locais](#alteração-de-políticas-locais)
   - [Usando o secpol.msc](#usando-o-secpolmsc)
   - [Usando o gpedit.msc](#usando-o-gpeditmsc)
6. [Logs Detalhados](#logs-detalhados)
7. [Comparativo entre PowerShell e Bash](#comparativo-entre-powershell-e-bash)
8. [Funções no PowerShell](#funções-no-powershell)
   - [Funções Simples](#funções-simples)
   - [Funções Avançadas](#funções-avançadas)
9. [Lógica de Programação no PowerShell](#lógica-de-programação-no-powershell)
   - [Estruturas Condicionais](#estruturas-condicionais)
   - [Laços de Repetição](#laços-de-repetição)
   - [Manipulação de Strings](#manipulação-de-strings)
10. [Referências](#referências)

## Introdução ao PowerShell
O PowerShell é uma plataforma de automação e gerenciamento de configurações baseada em .NET, utilizada para administrar sistemas Windows e, atualmente, também multiplataforma.  
**Depreciações:**  
- Alguns cmdlets e práticas do Windows PowerShell 5.1 foram descontinuados ou substituídos no PowerShell 7.x. Consulte as notas de versão para detalhes.

## Instalação e Atualização do PowerShell

### Verificando a Versão do PowerShell
```powershell
$PSVersionTable.PSVersion
```

### Instalando o PowerShell 7.x

**Via Instalador MSI:**  
- Baixe o instalador MSI do [GitHub oficial do PowerShell](https://github.com/PowerShell/PowerShell) e execute-o.

**Via Windows Package Manager (winget):**
```powershell
winget install --id Microsoft.Powershell --source winget
```

*Observação:* O PowerShell 7.x pode coexistir com o Windows PowerShell 5.1.

## Práticas Recomendadas

### Uso de Verbos Aprovados
Utilize verbos aprovados para funções e cmdlets, garantindo consistência e clareza.  
Referência: [Aprovados Verbos](https://learn.microsoft.com/pt-br/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
```powershell
function Get-ProcessInfo {
    param (
        [string]$ProcessName
    )
    Get-Process -Name $ProcessName
}
```

### Comentários Instrutivos
Adicione comentários detalhados para facilitar a compreensão e a manutenção do script.
```powershell
# Função para obter informações de um processo específico
function Get-ProcessInfo {
    param (
        # Nome do processo
        [string]$ProcessName
    )
    # Retorna os detalhes do processo
    Get-Process -Name $ProcessName
}
```

### Tratamento de Erros
Utilize blocos try/catch para um tratamento robusto de erros.
```powershell
try {
    Stop-Service -Name 'NomeDoServico' -ErrorAction Stop
} catch {
    Write-Error "Falha ao parar o serviço: $_"
}
```

## Instalação de Software

### Usando o Windows Package Manager (winget)
**Instalar o Visual Studio Code:**
```powershell
winget install --id Microsoft.VisualStudioCode --source winget
```

**Instalação Silenciosa:**
```powershell
winget install --id Microsoft.VisualStudioCode --source winget --silent
```

*Observação:* Nem todos os pacotes suportam instalação silenciosa; verifique a documentação do pacote.

### Usando o Chocolatey
**Instalação do Chocolatey:**
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

**Instalar o Google Chrome:**
```powershell
choco install googlechrome -y
```

## Alteração de Políticas Locais

### Usando o secpol.msc
1. Pressione `Win + R`, digite `secpol.msc` e pressione Enter.
2. Navegue até **Políticas Locais > Atribuição de Direitos de Usuário**.
3. Realize as alterações desejadas.

### Usando o gpedit.msc
1. Pressione `Win + R`, digite `gpedit.msc` e pressione Enter.
2. Navegue até as configurações em **Configuração do Computador** ou **Configuração do Usuário**.
3. Modifique as políticas conforme necessário.

## Logs Detalhados

### Registro de Sessão com Start/Stop-Transcript
```powershell
Start-Transcript -Path "C:\Logs\session.log" -Append
# Execução de comandos a serem registrados
Stop-Transcript
```

### Logging Personalizado
Utilize Out-File ou Add-Content para gerar logs customizados.
```powershell
"Registro de atividade em $(Get-Date)" | Out-File "C:\Logs\custom.log" -Append
```

## Comparativo entre PowerShell e Bash

| Aspecto                   | PowerShell                                        | Bash                                             |
|---------------------------|---------------------------------------------------|--------------------------------------------------|
| **Ambiente**              | Windows; multiplataforma (Linux, macOS)           | Principalmente Linux, macOS, Unix                |
| **Sintaxe**               | Cmdlets, funções, orientado a objetos             | Comandos utilitários e scripts baseados em shell |
| **Manipulação de Dados**  | Trabalha com objetos; tipagem forte               | Trabalha com texto; tipagem fraca                |
| **Tratamento de Erros**   | Estrutura try/catch nativa                        | Uso de códigos de retorno e traps                |
| **Depreciações**          | Algumas práticas do PS5.1 foram substituídas      | Geralmente menos mudanças drásticas              |

## Funções no PowerShell

### Funções Simples
```powershell
function Get-FileCount {
    param (
        [string]$Directory = "."
    )
    (Get-ChildItem -Path $Directory).Count
}
```

### Funções Avançadas
```powershell
function Invoke-AdvancedTask {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$TaskName,

        [Parameter()]
        [ValidateSet("Low", "Medium", "High")]
        [string]$Priority = "Medium"
    )
    process {
        Write-Verbose "Executando tarefa: $TaskName com prioridade $Priority"
        # Implementação de lógica avançada
    }
}
```

## Lógica de Programação no PowerShell

### Estruturas Condicionais
```powershell
$number = 10
if ($number -gt 10) {
    "Maior que 10"
} elseif ($number -eq 10) {
    "Igual a 10"
} else {
    "Menor que 10"
}
```

### Laços de Repetição

**For Loop:**
```powershell
for ($i = 0; $i -lt 5; $i++) {
    "Iteração $i"
}
```

**Foreach Loop:**
```powershell
$files = Get-ChildItem
foreach ($file in $files) {
    $file.Name
}
```

**While Loop:**
```powershell
$count = 0
while ($count -lt 5) {
    "Contagem: $count"
    $count++
}
```

**Do-While Loop:**
```powershell
$count = 0
do {
    "Contagem: $count"
    $count++
} while ($count -lt 5)
```

### Manipulação de Strings
**Concatenação e Interpolação:**
```powershell
$name = "PowerShell"
"Bem-vindo ao $name!"
```

**Divisão e Substituição:**
```powershell
$text = "um,dois,três"
$parts = $text -split ","
$replaced = $text -replace "um", "primeiro"
```

## Referências
- [Documentação do PowerShell](https://learn.microsoft.com/pt-br/powershell/)
- [Migrando do Windows PowerShell 5.1 para o PowerShell 7](https://learn.microsoft.com/pt-br/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7)
- [Aprovados Verbos](https://learn.microsoft.com/pt-br/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
- [Windows Package Manager (winget)](https://learn.microsoft.com/pt-br/windows/package-manager/winget/)
- [Chocolatey](https://chocolatey.org/)