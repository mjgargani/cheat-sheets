# Cheat Sheets de Desenvolvimento

Este repositório contém uma coleção de cheat sheets para várias tecnologias e ferramentas de desenvolvimento. Cada arquivo fornece comandos essenciais, exemplos de configuração e práticas recomendadas para ajudar os desenvolvedores a trabalhar de forma eficiente com essas tecnologias.

**Nota:** Estes cheat sheets foram construídos e atualizados com a ajuda do Chat-GPT.

## Ghostwriter para Leitura

Adicionamos o [Ghostwriter 2.1.6 Portable](./ghostwriter_2.1.6_win64_portable) ao repositório. Este editor minimalista de Markdown oferece:

- **Visualização Limpa:** Veja o conteúdo em tempo real com temas customizáveis.
- **Suporte ao Repositório:** Ideal para explorar e editar os cheat sheets.
- **Portabilidade:** Funciona diretamente sem necessidade de instalação.

---

## Conteúdo

- [Docker](docker-cheat-sheet.md)
- [Jest com TypeScript e NestJS](jest-ts-nestjs-cheat-sheet.md)
- [MongoDB](mongodb-cheat-sheet.md)
- [Mongoose](mongoose-cheat-sheet.md)
- [NestJS](nestjs-cheat-sheet.md)
- [Node.js](nodejs-cheat-sheet.md)
- [ProxMox Virtual Environment](pve-cheat-sheet.md)
- [TypeScript](typescript-cheat-sheet.md)
- [Vite com React e TypeScript](vite-reactjs-ts-cheat-sheet.md)
- [Visual Studio Code](vscode-cheat-sheet.md)
- [Visual Studio Code Server](vscode-server-cheat-sheet.md)

---

## Políticas de Uso de IA

Este repositório adota práticas éticas no uso de Inteligências Artificiais (IAs) durante o desenvolvimento. Detalhes sobre o uso dessas ferramentas estão documentados na pasta [./AI-Usage-Policy](./AI-Usage-Policy), que contém os seguintes arquivos:

- [Termo de Responsabilidade pelo Uso de IAs no Desenvolvimento](./AI-Usage-Policy/responsability.md): Declaração de princípios, regras e práticas relacionadas ao uso ético de IAs.
- [Registros do ChatGPT](./AI-Usage-Policy/chatgpt.logs.md): Resumo das interações e contribuições realizadas com o suporte do ChatGPT.
- [Registros do GitHub Copilot](./AI-Usage-Policy/ghcopilot.logs.md): Relatório sobre o uso e suporte fornecido pelo GitHub Copilot.

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
