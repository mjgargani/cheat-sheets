### **Português (pt-BR)**

# Cheat Sheets de Desenvolvimento

Este repositório contém uma coleção de cheat sheets para várias tecnologias e ferramentas de desenvolvimento. Cada arquivo fornece comandos essenciais, exemplos de configuração e práticas recomendadas para ajudar os desenvolvedores a trabalhar de forma eficiente com essas tecnologias.

**Nota:** Estes cheat sheets foram construídos e atualizados com a ajuda do Chat-GPT.

## Ghostwriter para Leitura

Os arquivos deste repositório podem ser lidos e editados utilizando o [Ghostwriter](https://wereturtle.github.io/ghostwriter/), um editor minimalista de Markdown que oferece:

- **Visualização Limpa:** Veja o conteúdo em tempo real com temas customizáveis.
- **Suporte ao Repositório:** Ideal para explorar e editar os cheat sheets.
- **Portabilidade:** Funciona diretamente sem necessidade de instalação.

Para instruções específicas sobre o uso do Ghostwriter, consulte o arquivo [instructions.md](./ghostwriter/instructions.md) localizado na pasta `./ghostwriter`.

---

## Conteúdo

### AI-Usage-Policy
- [Termo de Responsabilidade](./AI-Usage-Policy/responsability.md)
- [Registros do ChatGPT](./AI-Usage-Policy/chatgpt.logs.md)
- [Registros do GitHub Copilot](./AI-Usage-Policy/ghcopilot.logs.md)

### Cheat Sheets
#### Networking
- [Conceitos Avançados](./cheat-sheets/networking/advanced/concepts.md)

#### Programming
- **JavaScript**
  - [Vanilla JavaScript](./cheat-sheets/programming/javascript/vanilla.md)
- **MongoDB**
  - [Cheat Sheet do MongoDB](./cheat-sheets/programming/mongodb/mongodb-cheat-sheet.md)
  - [Cheat Sheet do Mongoose](./cheat-sheets/programming/mongodb/mongoose-cheat-sheet.md)
- **NestJS**
  - [Cheat Sheet do Jest com TypeScript e NestJS](./cheat-sheets/programming/nestjs/jest-ts-nestjs-cheat-sheet.md)
  - [Cheat Sheet do NestJS](./cheat-sheets/programming/nestjs/nestjs-cheat-sheet.md)
- **Node.js**
  - [Cheat Sheet do Node.js](./cheat-sheets/programming/nodejs/nodejs-cheat-sheet.md)
  - [Vite com React e TypeScript](./cheat-sheets/programming/nodejs/vite-reactjs-ts-cheat-sheet.md)
  - [Vite com Vitest](./cheat-sheets/programming/nodejs/vite-vitest-cheat-sheet.md)
- **Shell**
  - [Shell Scripting](./cheat-sheets/programming/shell/scripting.md)
- **TypeScript**
  - [Cheat Sheet do TypeScript](./cheat-sheets/programming/typescript/typescript-cheat-sheet.md)

#### Servers
- **Files**
  - [Linux File Server](./cheat-sheets/servers/files/linux.md)
  - [Windows File Server](./cheat-sheets/servers/files/windows.md)
- **Web**
  - [Node.js Básico](./cheat-sheets/servers/web/basics-nodejs.md)

#### Systems
- **Docker**
  - [Cheat Sheet do Docker](./cheat-sheets/systems/docker/docker-cheat-sheet.md)
- **Linux**
  - [Estrutura de Pastas no Linux](./cheat-sheets/systems/linux/folder-structure.md)
  - [ProxMox Virtual Environment](./cheat-sheets/systems/linux/pve-cheat-sheet.md)

#### Tools
- **VSCode**
  - [Cheat Sheet do VSCode](./cheat-sheets/tools/vscode/vscode-cheat-sheet.md)
  - [Cheat Sheet do VSCode Server](./cheat-sheets/tools/vscode/vscode-server-cheat-sheet.md)

---

## Script de Compressão

Para facilitar a compressão e envio de versões do projeto para análise ou revisão, incluímos o script `compress_project.sh`. Este script:

- Compacta o repositório atual em um arquivo ZIP com alta compressão.
- Nomeia o arquivo com o formato `md_cheat-sheets_<timestamp>.zip`.
- Automatiza o processo de geração de backups datados.

### Uso do Script

1. Certifique-se de que o script está no diretório raiz do repositório.
2. Torne o script executável:
   ```bash
   chmod +x compress_project.sh
   ```
3. Execute o script:
   ```bash
   ./compress_project.sh
   ```
   Isso criará um arquivo ZIP na raiz do repositório com a data e hora atuais no nome.

---

## Como Usar

Cada arquivo de cheat sheet está organizado de forma a fornecer uma referência rápida e fácil para comandos e configurações comuns. Basta abrir o arquivo correspondente à tecnologia ou ferramenta que você está utilizando.

---

## Contribuições

Contribuições são bem-vindas! Se você deseja adicionar novos cheat sheets ou melhorar os existentes, sinta-se à vontade para abrir um pull request.
