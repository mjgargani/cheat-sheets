# NestJS Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet cobre os conceitos e práticas essenciais do NestJS, um framework progressivo para construir aplicações Node.js escaláveis e robustas. Baseado nas últimas versões e melhores práticas, ele serve como um guia rápido para desenvolvimento e abstrações pedagógicas.

## Índice (pt-BR)

1. [O que é o NestJS?](#o-que-e-o-nestjs)
2. [Instalação](#instalacao)
3. [Estrutura do Projeto](#estrutura-do-projeto)
4. [Módulos e Injeção de Dependência](#modulos-e-injecao-de-dependencia)
5. [Controladores](#controladores)
6. [Serviços](#servicos)
7. [Pipes e Interceptadores](#pipes-e-interceptadores)
8. [Guards e Middleware](#guards-e-middleware)
9. [Testes no NestJS](#testes-no-nestjs)
10. [Recursos Depreciados](#recursos-depreciados)
11. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is NestJS?](#what-is-nestjs)
2. [Installation](#installation)
3. [Project Structure](#project-structure)
4. [Modules and Dependency Injection](#modules-and-dependency-injection)
5. [Controllers](#controllers)
6. [Services](#services)
7. [Pipes and Interceptors](#pipes-and-interceptors)
8. [Guards and Middleware](#guards-and-middleware)
9. [Testing in NestJS](#testing-in-nestjs)
10. [Deprecated Features](#deprecated-features)
11. [Additional References](#additional-references)

---

### O que é o NestJS? (pt-BR)

NestJS é um framework para construção de aplicações Node.js escaláveis e fortemente tipadas. Baseado no TypeScript, ele utiliza conceitos de Programação Orientada a Objetos (POO) e Injeção de Dependência, inspirando-se no Angular para fornecer uma estrutura modular.

- **Modularidade**: Organize seu código em módulos reutilizáveis.
- **Flexibilidade**: Integração fácil com bibliotecas externas.
- **Ferramentas Avançadas**: Suporte nativo para GraphQL, WebSockets, e validações.

Mais informações: [Documentação Oficial do NestJS](https://docs.nestjs.com/).

### What is NestJS? (en-US)

NestJS is a framework for building scalable and strongly-typed Node.js applications. Built with TypeScript, it employs Object-Oriented Programming (OOP) and Dependency Injection concepts, taking inspiration from Angular to provide a modular structure.

- **Modularity**: Organize your code into reusable modules.
- **Flexibility**: Easy integration with external libraries.
- **Advanced Tools**: Native support for GraphQL, WebSockets, and validations.

More information: [NestJS Official Documentation](https://docs.nestjs.com/).

---

### Instalação (pt-BR)

Instale o NestJS CLI e crie um novo projeto:

```bash
npm install -g @nestjs/cli
nest new nome-do-projeto
```

### Installation (en-US)

Install the NestJS CLI and create a new project:

```bash
npm install -g @nestjs/cli
nest new project-name
```

---

### Estrutura do Projeto (pt-BR)

Ao criar um novo projeto, a estrutura inicial será:

```
project-root/
├── src/
│   ├── app.controller.ts
│   ├── app.module.ts
│   ├── app.service.ts
│   └── main.ts
├── test/
├── package.json
└── tsconfig.json
```

### Project Structure (en-US)

When creating a new project, the initial structure will be:

```
project-root/
├── src/
│   ├── app.controller.ts
│   ├── app.module.ts
│   ├── app.service.ts
│   └── main.ts
├── test/
├── package.json
└── tsconfig.json
```

---

### Módulos e Injeção de Dependência (pt-BR)

Módulos são a base da organização no NestJS:

**Exemplo de Módulo:**

```typescript
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

### Modules and Dependency Injection (en-US)

Modules are the foundation of organization in NestJS:

**Module Example:**

```typescript
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

---

### Controladores (pt-BR)

Controladores gerenciam rotas e respostas HTTP:

**Exemplo:**

```typescript
import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
```

### Controllers (en-US)

Controllers manage routes and HTTP responses:

**Example:**

```typescript
import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
```

---

### Testes no NestJS (pt-BR)

Use o Jest para testes unitários e de integração:

**Teste de Unidade Exemplo:**

```typescript
import { Test, TestingModule } from '@nestjs/testing';
import { AppService } from './app.service';

describe('AppService', () => {
  let service: AppService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AppService],
    }).compile();

    service = module.get<AppService>(AppService);
  });

  it('should return "Hello World!"', () => {
    expect(service.getHello()).toBe('Hello World!');
  });
});
```

### Testing in NestJS (en-US)

Use Jest for unit and integration tests:

**Unit Test Example:**

```typescript
import { Test, TestingModule } from '@nestjs/testing';
import { AppService } from './app.service';

describe('AppService', () => {
  let service: AppService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AppService],
    }).compile();

    service = module.get<AppService>(AppService);
  });

  it('should return "Hello World!"', () => {
    expect(service.getHello()).toBe('Hello World!');
  });
});
```

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do NestJS](https://docs.nestjs.com/)
- [Repositório GitHub do NestJS](https://github.com/nestjs/nest)

### Additional References (en-US)

- [NestJS Official Documentation](https://docs.nestjs.com/)
- [NestJS GitHub Repository](https://github.com/nestjs/nest)
