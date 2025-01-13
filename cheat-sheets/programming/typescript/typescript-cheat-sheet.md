# TypeScript Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet fornece uma visão abrangente das funcionalidades do TypeScript, um superset do JavaScript que adiciona tipagem estática opcional. Baseado nas últimas versões, inclui conceitos básicos, melhores práticas e abstrações pedagógicas para facilitar o aprendizado.

## Índice (pt-BR)

1. [O que é TypeScript?](#o-que-e-typescript)
2. [Instalação e Configuração](#instalacao-e-configuracao)
3. [Tipos Básicos](#tipos-basicos)
4. [Interfaces e Tipos](#interfaces-e-tipos)
5. [Classes e Herança](#classes-e-heranca)
6. [Funções](#funcoes)
7. [Generics](#generics)
8. [Módulos e Namespaces](#modulos-e-namespaces)
9. [Recursos Depreciados](#recursos-depreciados)
10. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is TypeScript?](#what-is-typescript)
2. [Installation and Setup](#installation-and-setup)
3. [Basic Types](#basic-types)
4. [Interfaces and Types](#interfaces-and-types)
5. [Classes and Inheritance](#classes-and-inheritance)
6. [Functions](#functions)
7. [Generics](#generics)
8. [Modules and Namespaces](#modules-and-namespaces)
9. [Deprecated Features](#deprecated-features)
10. [Additional References](#additional-references)

---

### O que é TypeScript? (pt-BR)

TypeScript é um superset do JavaScript que adiciona tipagem estática opcional e recursos avançados para o desenvolvimento em escala. Ele é projetado para facilitar a manutenção e detecção de erros antes do tempo de execução.

- **Tipagem Estática**: Define tipos para variáveis, funções e retornos.
- **Ferramentas Avançadas**: IntelliSense, refatoração e verificação de erros.
- **Compilação para JavaScript**: Código TypeScript é transpilado para JavaScript.

Mais informações: [Documentação Oficial do TypeScript](https://www.typescriptlang.org/).

### What is TypeScript? (en-US)

TypeScript is a superset of JavaScript that adds optional static typing and advanced features for scalable development. It is designed to improve maintainability and catch errors before runtime.

- **Static Typing**: Define types for variables, functions, and returns.
- **Advanced Tooling**: IntelliSense, refactoring, and error checking.
- **Compiles to JavaScript**: TypeScript code is transpiled into JavaScript.

More information: [TypeScript Official Documentation](https://www.typescriptlang.org/).

---

### Instalação e Configuração (pt-BR)

**Instalação via npm**:

```bash
npm install -g typescript
```

**Criar um arquivo de configuração (`tsconfig.json`)**:

```bash
tsc --init
```

### Installation and Setup (en-US)

**Install via npm**:

```bash
npm install -g typescript
```

**Create a configuration file (`tsconfig.json`)**:

```bash
tsc --init
```

---

### Tipos Básicos (pt-BR)

```typescript
let isDone: boolean = false;
let decimal: number = 10;
let name: string = 'TypeScript';
let list: number[] = [1, 2, 3];
let tuple: [string, number] = ['TypeScript', 10];
```

### Basic Types (en-US)

```typescript
let isDone: boolean = false;
let decimal: number = 10;
let name: string = 'TypeScript';
let list: number[] = [1, 2, 3];
let tuple: [string, number] = ['TypeScript', 10];
```

---

### Interfaces e Tipos (pt-BR)

```typescript
interface User {
  name: string;
  age: number;
  isAdmin?: boolean;
}

function greet(user: User): string {
  return `Hello, ${user.name}`;
}
```

### Interfaces and Types (en-US)

```typescript
interface User {
  name: string;
  age: number;
  isAdmin?: boolean;
}

function greet(user: User): string {
  return `Hello, ${user.name}`;
}
```

---

### Classes e Herança (pt-BR)

```typescript
class Person {
  constructor(public name: string) {}

  greet(): string {
    return `Hello, ${this.name}`;
  }
}

class Employee extends Person {
  constructor(name: string, public position: string) {
    super(name);
  }

  work(): string {
    return `${this.name} is working as a ${this.position}`;
  }
}
```

### Classes and Inheritance (en-US)

```typescript
class Person {
  constructor(public name: string) {}

  greet(): string {
    return `Hello, ${this.name}`;
  }
}

class Employee extends Person {
  constructor(name: string, public position: string) {
    super(name);
  }

  work(): string {
    return `${this.name} is working as a ${this.position}`;
  }
}
```

---

### Generics (pt-BR)

```typescript
function identity<T>(arg: T): T {
  return arg;
}

let output = identity<string>('TypeScript');
```

### Generics (en-US)

```typescript
function identity<T>(arg: T): T {
  return arg;
}

let output = identity<string>('TypeScript');
```

---

### Recursos Depreciados (pt-BR)

Consulte os recursos obsoletos na [documentação oficial do TypeScript](https://www.typescriptlang.org/docs/).

### Deprecated Features (en-US)

Refer to deprecated features in the [official TypeScript documentation](https://www.typescriptlang.org/docs/).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do TypeScript](https://www.typescriptlang.org/)
- [Guia de Configuração](https://www.typescriptlang.org/tsconfig)

### Additional References (en-US)

- [TypeScript Official Documentation](https://www.typescriptlang.org/)
- [Configuration Guide](https://www.typescriptlang.org/tsconfig)
