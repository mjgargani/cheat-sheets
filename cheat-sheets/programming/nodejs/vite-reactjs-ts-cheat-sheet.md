# Vite + React + TypeScript Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet cobre como configurar e usar um projeto React com TypeScript utilizando Vite, uma ferramenta rápida de build. Inclui as melhores práticas, explicações pedagógicas e abstrações para facilitar o entendimento.

## Índice (pt-BR)

1. [O que é o Vite?](#o-que-e-o-vite)
2. [Instalação e Configuração](#instalacao-e-configuracao)
3. [Estrutura do Projeto](#estrutura-do-projeto)
4. [Configuração do Vite](#configuracao-do-vite)
5. [Configuração do TypeScript](#configuracao-do-typescript)
6. [Executando o Servidor de Desenvolvimento](#executando-o-servidor-de-desenvolvimento)
7. [Build para Produção](#build-para-producao)
8. [Recursos Depreciados](#recursos-depreciados)
9. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is Vite?](#what-is-vite)
2. [Installation and Setup](#installation-and-setup)
3. [Project Structure](#project-structure)
4. [Vite Configuration](#vite-configuration)
5. [TypeScript Configuration](#typescript-configuration)
6. [Running the Development Server](#running-the-development-server)
7. [Building for Production](#building-for-production)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

### O que é o Vite? (pt-BR)

Vite é uma ferramenta de build moderna que fornece um ambiente de desenvolvimento rápido para projetos web. Ele utiliza o ESBuild para carregamento ultrarrápido e é otimizado para projetos modernos de JavaScript.

- **Rápido**: Compilação incremental utilizando ESBuild.
- **Flexível**: Suporte nativo a TypeScript, JSX e CSS Modules.
- **Fácil de Configurar**: Arquitetura minimalista.

Mais informações: [Documentação do Vite](https://vitejs.dev/).

### What is Vite? (en-US)

Vite is a modern build tool that provides a fast development environment for web projects. It leverages ESBuild for ultra-fast bundling and is optimized for modern JavaScript projects.

- **Fast**: Incremental compilation using ESBuild.
- **Flexible**: Native support for TypeScript, JSX, and CSS Modules.
- **Easy to Configure**: Minimalistic architecture.

More information: [Vite Documentation](https://vitejs.dev/).

---

### Instalação e Configuração (pt-BR)

**Criar um novo projeto com Vite e TypeScript**:

```bash
npm create vite@latest my-react-app -- --template react-ts
```

### Installation and Setup (en-US)

**Create a new project with Vite and TypeScript**:

```bash
npm create vite@latest my-react-app -- --template react-ts
```

---

### Estrutura do Projeto (pt-BR)

Após a configuração, a estrutura do projeto será:

```
my-react-app/
├── node_modules/
├── public/
│   └── index.html
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   └── vite-env.d.ts
├── .gitignore
├── package.json
├── tsconfig.json
└── vite.config.ts
```

### Project Structure (en-US)

After setup, the project structure will look like this:

```
my-react-app/
├── node_modules/
├── public/
│   └── index.html
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   └── vite-env.d.ts
├── .gitignore
├── package.json
├── tsconfig.json
└── vite.config.ts
```

---

### Configuração do Vite (pt-BR)

**Exemplo de `vite.config.ts`**:

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    open: true,
  },
});
```

### Vite Configuration (en-US)

**Example `vite.config.ts`**:

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    open: true,
  },
});
```

---

### Configuração do TypeScript (pt-BR)

**Exemplo de `tsconfig.json`**:

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "jsx": "react-jsx",
    "strict": true,
    "moduleResolution": "node",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src"]
}
```

### TypeScript Configuration (en-US)

**Example `tsconfig.json`**:

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "jsx": "react-jsx",
    "strict": true,
    "moduleResolution": "node",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src"]
}
```

---

### Executando o Servidor de Desenvolvimento (pt-BR)

Inicie o servidor com:

```bash
npm run dev
```

Acesse a aplicação em `http://localhost:3000`.

### Running the Development Server (en-US)

Start the server with:

```bash
npm run dev
```

Access the application at `http://localhost:3000`.

---

### Build para Produção (pt-BR)

Crie um build otimizado para produção:

```bash
npm run build
```

Os arquivos de saída estarão na pasta `dist`.

### Building for Production (en-US)

Create an optimized production build:

```bash
npm run build
```

The output files will be in the `dist` directory.

---

### Recursos Depreciados (pt-BR)

Consulte os recursos obsoletos no [guia de atualização do Vite](https://vitejs.dev/guide/migration.html).

### Deprecated Features (en-US)

Refer to deprecated features in the [Vite migration guide](https://vitejs.dev/guide/migration.html).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do Vite](https://vitejs.dev/)
- [Documentação do React](https://react.dev/)
- [Guia do TypeScript](https://www.typescriptlang.org/docs/)

### Additional References (en-US)

- [Vite Official Documentation](https://vitejs.dev/)
- [React Documentation](https://react.dev/)
- [TypeScript Guide](https://www.typescriptlang.org/docs/)
