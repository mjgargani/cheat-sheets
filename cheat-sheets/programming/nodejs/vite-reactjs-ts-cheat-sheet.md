# Vite + React + TypeScript Cheat Sheet

This cheat sheet provides a comprehensive guide to setting up and using a React project with TypeScript powered by Vite, a fast build tool. It includes best practices and simplified explanations for quick adoption.

---

## Table of Contents

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

## What is Vite?

Vite is a modern build tool that provides a fast development environment for web projects. Leveraging ESBuild for ultra-fast bundling, it is optimized for modern JavaScript and TypeScript workflows.

- **Fast**: Incremental compilation using ESBuild.
- **Flexible**: Native support for TypeScript, JSX, and CSS Modules.
- **Easy to Configure**: Minimalistic architecture with a user-friendly configuration.

More information: [Vite Official Documentation](https://vitejs.dev/).

---

## Installation and Setup

Create a new project with Vite and TypeScript:

```bash
npm create vite@latest my-react-app -- --template react-ts
```

---

## Project Structure

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

## Vite Configuration

Example `vite.config.ts`:

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

## TypeScript Configuration

Example `tsconfig.json`:

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

## Running the Development Server

Start the server:

```bash
npm run dev
```

Access the application at `http://localhost:3000`.

---

## Building for Production

Create an optimized production build:

```bash
npm run build
```

The output files will be in the `dist` directory.

---

## Deprecated Features

Refer to deprecated features in the [Vite migration guide](https://vitejs.dev/guide/migration.html).

---

## Additional References

- [Vite Official Documentation](https://vitejs.dev/)
- [React Documentation](https://react.dev/)
- [TypeScript Guide](https://www.typescriptlang.org/docs/)
