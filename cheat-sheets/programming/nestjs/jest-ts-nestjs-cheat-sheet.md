# Jest + TypeScript + NestJS Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet atualizado aborda o uso do Jest em projetos Node.js com TypeScript e NestJS, detalhando recursos como mocks, spies e testes avançados. O conteúdo foi baseado nas melhores práticas de desenvolvimento e nas versões mais recentes de Jest e NestJS.

## Índice (pt-BR)

1. [Instalação](#instalacao)
2. [Configuração do Jest](#configuracao-do-jest)
3. [Estrutura de Pastas](#estrutura-de-pastas)
4. [Testes Unitários](#testes-unitarios)
5. [Testes de Integração e E2E](#testes-de-integracao-e-e2e)
6. [Recursos Avançados](#recursos-avancados)
7. [Recursos Depreciados](#recursos-depreciados)
8. [Referências Adicionais](#referencias-adicionais)

---

## Table of Contents (en-US)

1. [Installation](#installation)
2. [Jest Configuration](#jest-configuration)
3. [Folder Structure](#folder-structure)
4. [Unit Testing](#unit-testing)
5. [Integration and E2E Testing](#integration-and-e2e-testing)
6. [Advanced Features](#advanced-features)
7. [Deprecated Features](#deprecated-features)
8. [Additional References](#additional-references)

---

### O que é o Jest? (pt-BR)

Jest é um framework de testes completo para aplicações JavaScript e TypeScript. Ele suporta testes unitários, de integração e de ponta a ponta, e vem integrado com funcionalidades como mocks e spies.

- **Mocks**: Simulam funções ou módulos externos.
- **Spies**: Observam chamadas a métodos reais para verificar comportamentos.
- **Cobertura de Código**: Gera relatórios detalhados sobre quais partes do código foram testadas.

Para mais informações: [Jest Official Docs](https://jestjs.io/pt-BR/).

### What is Jest? (en-US)

Jest is a comprehensive testing framework for JavaScript and TypeScript applications. It supports unit, integration, and end-to-end testing and comes with built-in features like mocks and spies.

- **Mocks**: Simulate external functions or modules.
- **Spies**: Monitor real method calls to verify behaviors.
- **Code Coverage**: Provides detailed reports on tested code areas.

For more information: [Jest Official Docs](https://jestjs.io/).

---

### Instalação (pt-BR)

Instale o Jest e dependências necessárias:

```bash
npm install --save-dev jest ts-jest @types/jest @nestjs/testing supertest
```

### Installation (en-US)

Install Jest and required dependencies:

```bash
npm install --save-dev jest ts-jest @types/jest @nestjs/testing supertest
```

---

### Configuração do Jest (pt-BR)

Crie o arquivo `jest.config.ts`:

```typescript
import type { JestConfigWithTsJest } from 'ts-jest';

const config: JestConfigWithTsJest = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  transform: {
    '^.+\\.ts$': 'ts-jest',
  },
  collectCoverage: true,
  coverageReporters: ['text', 'lcov'],
};

export default config;
```

### Jest Configuration (en-US)

Create the `jest.config.ts` file:

```typescript
import type { JestConfigWithTsJest } from 'ts-jest';

const config: JestConfigWithTsJest = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  transform: {
    '^.+\\.ts$': 'ts-jest',
  },
  collectCoverage: true,
  coverageReporters: ['text', 'lcov'],
};

export default config;
```

---

### Estrutura de Pastas (pt-BR)

Organize seu projeto com a seguinte estrutura:

```
project-root/
├── src/
│   ├── app.controller.ts
│   └── app.service.ts
├── test/
│   └── app.e2e-spec.ts
└── jest.config.ts
```

### Folder Structure (en-US)

Organize your project with the following structure:

```
project-root/
├── src/
│   ├── app.controller.ts
│   └── app.service.ts
├── test/
│   └── app.e2e-spec.ts
└── jest.config.ts
```

---

### Testes Unitários (pt-BR)

Exemplo de mock e spy no `AppService`:

```typescript
import { AppService } from './app.service';

describe('AppService', () => {
  let service: AppService;

  beforeEach(() => {
    service = new AppService();
  });

  it('should return "Hello World!"', () => {
    expect(service.getHello()).toBe('Hello World!');
  });
});
```

### Unit Testing (en-US)

Mock and spy example for `AppService`:

```typescript
import { AppService } from './app.service';

describe('AppService', () => {
  let service: AppService;

  beforeEach(() => {
    service = new AppService();
  });

  it('should return "Hello World!"', () => {
    expect(service.getHello()).toBe('Hello World!');
  });
});
```

---

### Testes de Integração e E2E (pt-BR)

Exemplo com `supertest`:

```typescript
import * as request from 'supertest';
import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import { AppModule } from '../src/app.module';

describe('AppController (e2e)', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/ (GET)', () => {
    return request(app.getHttpServer())
      .get('/')
      .expect(200)
      .expect('Hello World!');
  });
});
```

### Integration and E2E Testing (en-US)

Example with `supertest`:

```typescript
import * as request from 'supertest';
import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import { AppModule } from '../src/app.module';

describe('AppController (e2e)', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/ (GET)', () => {
    return request(app.getHttpServer())
      .get('/')
      .expect(200)
      .expect('Hello World!');
  });
});
```

---

### Recursos Avançados (pt-BR)

- **jest.spyOn**: Observa métodos reais:

```typescript
const spy = jest.spyOn(service, 'method');
service.method();
expect(spy).toHaveBeenCalled();
```

### Advanced Features (en-US)

- **jest.spyOn**: Observes real methods:

```typescript
const spy = jest.spyOn(service, 'method');
service.method();
expect(spy).toHaveBeenCalled();
```

---

### Recursos Depreciados (pt-BR)

Funções obsoletas são listadas na [documentação oficial do Jest](https://jestjs.io/pt-BR/docs/).

### Deprecated Features (en-US)

Deprecated functions are listed in the [official Jest documentation](https://jestjs.io/docs/).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do Jest](https://jestjs.io/pt-BR/)
- [Repositório GitHub do Jest](https://github.com/facebook/jest)

### Additional References (en-US)

- [Jest Official Documentation](https://jestjs.io/)
- [Jest GitHub Repository](https://github.com/facebook/jest)
