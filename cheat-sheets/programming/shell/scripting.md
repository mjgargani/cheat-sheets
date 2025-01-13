# Shell/Bash Script - Guia Completo

## Sumário

1. [Introdução](#introducao)
2. [Conceitos Básicos](#conceitos-basicos)
   - [O que é um Shell Script?](#o-que-e-um-shell-script)
   - [Primeiro Script](#primeiro-script)
   - [Execução de Scripts](#execucao-de-scripts)
3. [Conceitos Intermediários](#conceitos-intermediarios)
   - [Variáveis e Operações](#variaveis-e-operacoes)
   - [Estruturas Condicionais](#estruturas-condicionais)
   - [Loops](#loops)
4. [Conceitos Avançados](#conceitos-avancados)
   - [Funções](#funcoes)
   - [Manipulação de Arquivos](#manipulacao-de-arquivos)
   - [Depuração de Scripts](#depuracao-de-scripts)
5. [Dicas e Boas Práticas](#dicas-e-boas-praticas)
6. [Referências](#referencias)

---

## 1. Introdução

Shell scripting é uma forma poderosa de automatizar tarefas em sistemas Linux e Unix. Este guia aborda conceitos básicos e avançados para criar scripts eficientes e bem organizados.

---

## 2. Conceitos Básicos

### O que é um Shell Script?

Um shell script é um arquivo de texto contendo uma sequência de comandos que podem ser executados no terminal. Ele é interpretado pelo shell, como `bash`, `zsh`, ou `sh`.

### Primeiro Script

1. Crie um arquivo chamado `meu_script.sh`:
   ```bash
   nano meu_script.sh
   ```

2. Adicione o seguinte conteúdo:
   ```bash
   #!/bin/bash
   echo "Olá, mundo!"
   ```

3. Torne o script executável:
   ```bash
   chmod +x meu_script.sh
   ```

4. Execute o script:
   ```bash
   ./meu_script.sh
   ```

### Execução de Scripts

- **Execução direta**:
  ```bash
  ./meu_script.sh
  ```
- **Usando o interpretador**:
  ```bash
  bash meu_script.sh
  ```

---

## 3. Conceitos Intermediários

### Variáveis e Operações

1. Declaração de variáveis:
   ```bash
   nome="João"
   echo "Olá, $nome"
   ```

2. Operações matemáticas:
   ```bash
   x=$((5 + 3))
   echo "$x"
   ```

3. Variáveis de ambiente:
   ```bash
   echo "$HOME"
   echo "$PATH"
   ```

### Estruturas Condicionais

1. `if` simples:
   ```bash
   if [ $x -gt 5 ]; then
       echo "Maior que 5"
   fi
   ```

2. `if-else`:
   ```bash
   if [ $x -eq 5 ]; then
       echo "Igual a 5"
   else
       echo "Diferente de 5"
   fi
   ```

3. Operadores comuns:
   - Igual: `-eq`
   - Diferente: `-ne`
   - Maior que: `-gt`
   - Menor que: `-lt`

### Loops

1. `for` loop:
   ```bash
   for i in {1..5}; do
       echo "Número $i"
   done
   ```

2. `while` loop:
   ```bash
   count=0
   while [ $count -lt 5 ]; do
       echo "Contagem: $count"
       count=$((count + 1))
   done
   ```

---

## 4. Conceitos Avançados

### Funções

1. Definindo funções:
   ```bash
   minha_funcao() {
       echo "Esta é uma função."
   }
   minha_funcao
   ```

2. Passando parâmetros:
   ```bash
   soma() {
       echo $(( $1 + $2 ))
   }
   soma 5 3
   ```

### Manipulação de Arquivos

1. Lendo um arquivo linha por linha:
   ```bash
   while IFS= read -r linha; do
       echo "$linha"
   done < arquivo.txt
   ```

2. Redirecionamento de saída:
   ```bash
   echo "Texto" > arquivo.txt
   echo "Mais texto" >> arquivo.txt
   ```

### Depuração de Scripts

1. Executando em modo de depuração:
   ```bash
   bash -x meu_script.sh
   ```

2. Adicionando pontos de depuração:
   ```bash
   set -x  # Inicia depuração
   # Comandos
   set +x  # Encerra depuração
   ```

---

## 5. Dicas e Boas Práticas

- Sempre adicione o **shebang** (`#!/bin/bash`) no início do script.
- Use comentários para explicar comandos complexos.
- Valide entradas e trate erros com mensagens claras.
- Use nomes de variáveis descritivos para melhorar a legibilidade.
- Teste scripts em um ambiente seguro antes de usá-los em produção.

---

## 6. Referências

- GNU. [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html). Acesso em 12/01/2025.
- Linux Handbook. [Bash Scripting Basics](https://linuxhandbook.com/bash-scripting/). Acesso em 12/01/2025.
- Stack Overflow. [Shell Script Best Practices](https://stackoverflow.com/questions/). Acesso em 12/01/2025.
