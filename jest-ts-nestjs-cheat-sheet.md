Aqui está uma versão mais detalhada do cheat sheet para utilizar **Jest** com **Node.js**, **TypeScript**, e integração avançada com **NestJS**, incluindo o uso extensivo de **mocks**, **spies**, e outros recursos.

---

## **1. Instalação**

Instale as dependências necessárias:

```bash
npm install --save-dev jest ts-jest @types/jest @nestjs/testing supertest
```

---

## **2. Configuração do Jest**

Crie um arquivo `jest.config.ts` na raiz do projeto com as configurações otimizadas para TypeScript e NestJS:

```typescript
import type { JestConfigWithTsJest } from "ts-jest";

const config: JestConfigWithTsJest = {
    preset: "ts-jest",
    testEnvironment: "node",
    transform: {
        "^.+\\.ts$": "ts-jest",
    },
    moduleFileExtensions: ["ts", "js", "json"],
    testMatch: ["**/*.spec.ts", "**/*.e2e-spec.ts"],
    collectCoverage: true,
    coverageDirectory: "./coverage",
    coverageReporters: ["text", "lcov"],
    moduleNameMapper: {
        "^src/(.*)$": "<rootDir>/src/$1",
    },
};

export default config;
```

Adicione os scripts no `package.json`:

```json
{
    "scripts": {
        "test": "jest",
        "test:watch": "jest --watch",
        "test:cov": "jest --coverage",
        "test:e2e": "jest --config jest-e2e.config.ts"
    }
}
```

---

## **3. Estrutura de Pastas**

Organize as pastas e arquivos do projeto assim:

```
project-root/
├── src/
│   ├── app.controller.ts
│   ├── app.service.ts
│   ├── app.module.ts
│   └── main.ts
├── test/
│   └── app.e2e-spec.ts
├── jest.config.ts
├── tsconfig.json
└── package.json
```

---

## **4. Criando um Teste Unitário com Mocks e Spies**

### 4.1. Testando o `AppService` com mocks:

#### Código de exemplo:

**src/app.service.ts**

```typescript
export class AppService {
    getHello(): string {
        return "Hello World!";
    }
}
```

#### Teste com Jest:

**src/app.service.spec.ts**

```typescript
import { AppService } from "./app.service";

describe("AppService", () => {
    let appService: AppService;

    beforeEach(() => {
        appService = new AppService();
    });

    it('should return "Hello World!"', () => {
        expect(appService.getHello()).toBe("Hello World!");
    });

    it("should call getHello", () => {
        const spy = jest.spyOn(appService, "getHello");
        appService.getHello();
        expect(spy).toHaveBeenCalled();
    });
});
```

---

### 4.2. Testando o `AppController` com um mock do serviço:

#### Código de exemplo:

**src/app.controller.ts**

```typescript
import { Controller, Get } from "@nestjs/common";
import { AppService } from "./app.service";

@Controller()
export class AppController {
    constructor(private readonly appService: AppService) {}

    @Get()
    getHello(): string {
        return this.appService.getHello();
    }
}
```

#### Teste com Jest:

**src/app.controller.spec.ts**

```typescript
import { Test, TestingModule } from "@nestjs/testing";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";

describe("AppController", () => {
    let appController: AppController;
    let appService: AppService;

    const mockAppService = {
        getHello: jest.fn().mockReturnValue("Mocked Hello World!"),
    };

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            controllers: [AppController],
            providers: [{ provide: AppService, useValue: mockAppService }],
        }).compile();

        appController = module.get<AppController>(AppController);
        appService = module.get<AppService>(AppService);
    });

    it('should return "Mocked Hello World!"', () => {
        expect(appController.getHello()).toBe("Mocked Hello World!");
    });

    it("should call AppService.getHello", () => {
        appController.getHello();
        expect(mockAppService.getHello).toHaveBeenCalled();
    });
});
```

---

## **5. Criando um Teste E2E**

Use o suporte do NestJS para testes end-to-end (e2e).

### Exemplo de Teste:

#### Código de exemplo:

**src/app.module.ts**

```typescript
import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";

@Module({
    imports: [],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule {}
```

#### Teste E2E:

**test/app.e2e-spec.ts**

```typescript
import { Test, TestingModule } from "@nestjs/testing";
import { INestApplication } from "@nestjs/common";
import * as request from "supertest";
import { AppModule } from "./../src/app.module";

describe("AppController (e2e)", () => {
    let app: INestApplication;

    beforeAll(async () => {
        const moduleFixture: TestingModule = await Test.createTestingModule({
            imports: [AppModule],
        }).compile();

        app = moduleFixture.createNestApplication();
        await app.init();
    });

    it("/ (GET)", () => {
        return request(app.getHttpServer())
            .get("/")
            .expect(200)
            .expect("Hello World!");
    });

    afterAll(async () => {
        await app.close();
    });
});
```

---

## **6. Recursos Avançados**

### 6.1. Mockando Dependências:

Use o pacote `jest-mock`:

```typescript
jest.mock("./some-module", () => ({
    someFunction: jest.fn(() => "mocked value"),
}));
```

### 6.2. Usando `jest.spyOn` para observar métodos reais:

```typescript
const spy = jest.spyOn(service, "someMethod");
service.someMethod();
expect(spy).toHaveBeenCalled();
```

### 6.3. Testando exceções e erros:

```typescript
it("should throw an error", () => {
    jest.spyOn(service, "someMethod").mockImplementation(() => {
        throw new Error("Test error");
    });
    expect(() => service.someMethod()).toThrow("Test error");
});
```

---

Este cheat sheet oferece um guia completo e avançado para usar Jest com Node.js, TypeScript e NestJS, aproveitando ao máximo recursos como mocks, spies e testes integrados. Sinta-se à vontade para ajustar conforme necessário para atender aos requisitos do seu projeto! 🚀
