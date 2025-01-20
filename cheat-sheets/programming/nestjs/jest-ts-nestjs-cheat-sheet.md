# Jest + TypeScript + NestJS Cheat Sheet

This cheat sheet provides a detailed guide on using Jest in Node.js projects with TypeScript and NestJS. It covers essential features like mocks, spies, and advanced testing techniques, based on best practices and the latest versions of Jest and NestJS.

---

## Table of Contents

1. [What is Jest?](#what-is-jest)
2. [Installation](#installation)
3. [Jest Configuration](#jest-configuration)
4. [Folder Structure](#folder-structure)
5. [Unit Testing](#unit-testing)
6. [Integration and E2E Testing](#integration-and-e2e-testing)
7. [Advanced Features](#advanced-features)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

## What is Jest?

Jest is a comprehensive testing framework for JavaScript and TypeScript applications. It supports unit, integration, and end-to-end testing with built-in features like mocks and spies.

- **Mocks**: Simulate external functions or modules.
- **Spies**: Monitor real method calls to verify behaviors.
- **Code Coverage**: Provides detailed reports on tested code areas.

For more information: [Jest Official Docs](https://jestjs.io/).

---

## Installation

Install Jest and required dependencies:

```bash
npm install --save-dev jest ts-jest @types/jest @nestjs/testing supertest
```

---

## Jest Configuration

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

## Folder Structure

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

## Unit Testing

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

## Integration and E2E Testing

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

## Advanced Features

- **jest.spyOn**: Observes real methods:

```typescript
const spy = jest.spyOn(service, 'method');
service.method();
expect(spy).toHaveBeenCalled();
```

---

## Deprecated Features

Deprecated functions are listed in the [official Jest documentation](https://jestjs.io/docs/).

---

## Additional References

- [Jest Official Documentation](https://jestjs.io/)
- [Jest GitHub Repository](https://github.com/facebook/jest)
- [NestJS Testing Documentation](https://docs.nestjs.com/fundamentals/testing)
