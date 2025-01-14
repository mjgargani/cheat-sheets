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

### AI-Usage
- [Termo de Responsabilidade](./ai-usage/responsability.md)

### Cheat Sheets
#### Networking
- [Conceitos Avançados](./cheat-sheets/networking/advanced/concepts.md)

#### Programming
- **JavaScript**
  - [Vanilla JavaScript](./cheat-sheets/programming/javascript/vanilla.md)
- **MongoDB**
  - [MongoDB Cheat Sheet](./cheat-sheets/programming/mongodb/mongodb-cheat-sheet.md)
  - [Mongoose Cheat Sheet](./cheat-sheets/programming/mongodb/mongoose-cheat-sheet.md)
- **NestJS**
  - [DTOs e Relações](./cheat-sheets/programming/nestjs/dtos-relations.md)
  - [Cheat Sheet do Jest com TypeScript e NestJS](./cheat-sheets/programming/nestjs/jest-ts-nestjs-cheat-sheet.md)
  - [Cheat Sheet do NestJS](./cheat-sheets/programming/nestjs/nestjs-cheat-sheet.md)
  - [Validação com Class Validator](./cheat-sheets/programming/nestjs/nestjs-class-validator.md)
  - [DTO Genérico no NestJS](./cheat-sheets/programming/nestjs/nestjs-dto-generic.md)
  - [DTO com ORM/ODM no NestJS](./cheat-sheets/programming/nestjs/nestjs-dto-orm-odm.md)
  - [NestJS DTOs](./cheat-sheets/programming/nestjs/nestjs-dtos.md)
  - [Segurança no NestJS](./cheat-sheets/programming/nestjs/nestjs-security.md)
- **Node.js**
  - [Node.js Cheat Sheet](./cheat-sheets/programming/nodejs/nodejs-cheat-sheet.md)
  - [Vite com React e TypeScript](./cheat-sheets/programming/nodejs/vite-reactjs-ts-cheat-sheet.md)
  - [Vite com Vitest](./cheat-sheets/programming/nodejs/vite-vitest-cheat-sheet.md)
- **Shell**
  - [Shell Scripting](./cheat-sheets/programming/shell/scripting.md)
- **TypeScript**
  - [Decorators no NestJS](./cheat-sheets/programming/typescript/decorators-nestjs.md)
  - [TypeScript Cheat Sheet](./cheat-sheets/programming/typescript/typescript-cheat-sheet.md)

#### Servers
- **Files**
  - [Linux File Server](./cheat-sheets/servers/files/linux.md)
  - [Windows File Server](./cheat-sheets/servers/files/windows.md)
- **Web**
  - [Node.js Básico](./cheat-sheets/servers/web/basics-nodejs.md)

#### Systems
- **Docker**
  - [Docker Cheat Sheet](./cheat-sheets/systems/docker/docker-cheat-sheet.md)
- **Linux**
  - [Estrutura de Pastas no Linux](./cheat-sheets/systems/linux/folder-structure.md)
  - [ProxMox Virtual Environment](./cheat-sheets/systems/linux/pve-cheat-sheet.md)

#### Tools
- **VSCode**
  - [VSCode Cheat Sheet](./cheat-sheets/tools/vscode/vscode-cheat-sheet.md)
  - [VSCode Server Cheat Sheet](./cheat-sheets/tools/vscode/vscode-server-cheat-sheet.md)

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