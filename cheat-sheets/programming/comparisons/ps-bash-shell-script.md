# Comparativo entre PowerShell, Bash e Shell Script

## Índice

1. [Introdução](#introdução)
2. [Diferenças entre PowerShell, Bash e Shell Script](#diferenças-entre-powershell-bash-e-shell-script)
3. [Comparação de Sintaxe](#comparação-de-sintaxe)
   - [Declaração de Variáveis](#declaração-de-variáveis)
   - [Estruturas Condicionais](#estruturas-condicionais)
   - [Laços de Repetição](#laços-de-repetição)
   - [Funções](#funções)
   - [Manipulação de Strings](#manipulação-de-strings)
4. [Referências](#referências)

## Introdução

PowerShell, Bash e Shell Script são ferramentas amplamente utilizadas para automação e gerenciamento de sistemas. Cada uma possui características distintas que as tornam adequadas para diferentes ambientes e necessidades.

## Diferenças entre PowerShell, Bash e Shell Script

| Aspecto                   | PowerShell                                                                                               | Bash                                                                                                     | Shell Script                                                                                             |
|---------------------------|----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| **Ambiente**              | Desenvolvido pela Microsoft, nativo em Windows, mas disponível para Linux e macOS                        | Nativo em sistemas Unix/Linux, disponível para Windows via WSL                                           | Scripts escritos para shells Unix/Linux, como Bash, Sh, etc.                                             |
| **Sintaxe**               | Baseada em cmdlets e orientada a objetos                                                                 | Baseada em comandos e orientada a texto                                                                  | Depende do shell utilizado (Bash, Sh, etc.), geralmente orientada a texto                                 |
| **Manipulação de Dados**  | Trabalha com objetos .NET, permitindo manipulação avançada de dados                                      | Trabalha com texto e utiliza pipelines para manipulação                                                  | Trabalha com texto, manipulação depende das ferramentas disponíveis no shell                              |
| **Compatibilidade**       | Melhor integração com sistemas e aplicações Windows                                                      | Melhor compatibilidade com sistemas e ferramentas Unix/Linux                                             | Específico para o shell e sistema para o qual foi escrito                                                |
| **Uso Comum**             | Administração de sistemas Windows, automação de tarefas, scripts de configuração                         | Administração de sistemas Unix/Linux, automação de tarefas, scripts de inicialização                     | Automação de tarefas específicas no ambiente Unix/Linux                                                  |

## Comparação de Sintaxe

### Declaração de Variáveis

**PowerShell:**
```powershell
$variavel = "Olá, Mundo!"
```

**Bash:**
```bash
variavel="Olá, Mundo!"
```

**Shell Script (Sh):**
```sh
variavel="Olá, Mundo!"
```

### Estruturas Condicionais

**PowerShell:**
```powershell
$numero = 10
if ($numero -gt 5) {
    Write-Output "Maior que 5"
} elseif ($numero -eq 5) {
    Write-Output "Igual a 5"
} else {
    Write-Output "Menor que 5"
}
```

**Bash:**
```bash
numero=10
if [ $numero -gt 5 ]; then
    echo "Maior que 5"
elif [ $numero -eq 5 ]; then
    echo "Igual a 5"
else
    echo "Menor que 5"
fi
```

**Shell Script (Sh):**
```sh
numero=10
if [ $numero -gt 5 ]; then
    echo "Maior que 5"
elif [ $numero -eq 5 ]; then
    echo "Igual a 5"
else
    echo "Menor que 5"
fi
```

### Laços de Repetição

**PowerShell:**
```powershell
for ($i = 0; $i -lt 5; $i++) {
    Write-Output "Contagem: $i"
}
```

**Bash:**
```bash
for i in {0..4}; do
    echo "Contagem: $i"
done
```

**Shell Script (Sh):**
```sh
i=0
while [ $i -lt 5 ]; do
    echo "Contagem: $i"
    i=$((i + 1))
done
```

### Funções

**PowerShell:**
```powershell
function Saudacao {
    param (
        [string]$Nome = "Mundo"
    )
    Write-Output "Olá, $Nome!"
}

Saudacao "Rodrigo"
```

**Bash:**
```bash
saudacao() {
    nome=${1:-Mundo}
    echo "Olá, $nome!"
}

saudacao "Rodrigo"
```

**Shell Script (Sh):**
```sh
saudacao() {
    nome=${1:-Mundo}
    echo "Olá, $nome!"
}

saudacao "Rodrigo"
```

### Manipulação de Strings

**PowerShell:**
```powershell
$texto = "Olá, Mundo!"
$novoTexto = $texto.Replace("Mundo", "Rodrigo")
Write-Output $novoTexto  # Saída: Olá, Rodrigo!
```

**Bash:**
```bash
texto="Olá, Mundo!"
novo_texto=${texto//Mundo/Rodrigo}
echo $novo_texto  # Saída: Olá, Rodrigo!
```

**Shell Script (Sh):**
```sh
texto="Olá, Mundo!"
novo_texto=$(echo $texto | sed 's/Mundo/Rodrigo/')
echo $novo_texto  # Saída: Olá, Rodrigo!
```

## Referências

- [PowerShell vs. Bash: Key differences explained - TechTarget](https://www.techtarget.com/searchitoperations/tip/On-Windows-PowerShell-vs-Bash-comparison-gets-interesting)
- [Bash scripting vs PowerShell - LinuxConfig](https://linuxconfig.org/bash-scripting-vs-powershell)
- [Comparison of command shells - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_command_shells)