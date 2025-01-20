# NestJS Cheat Sheet

NestJS is a progressive Node.js framework designed for building scalable and maintainable applications. It combines the best practices of object-oriented programming (OOP), functional programming (FP), and reactive programming (RP), offering a modular architecture inspired by Angular.

---

## Table of Contents

1. [What is NestJS?](#what-is-nestjs)
2. [Installation](#installation)
3. [Project Structure](#project-structure)
4. [Modules and Dependency Injection](#modules-and-dependency-injection)
5. [Controllers](#controllers)
6. [Services](#services)
7. [Pipes and Interceptors](#pipes-and-interceptors)
8. [Guards and Middleware](#guards-and-middleware)
9. [Testing in NestJS](#testing-in-nestjs)
10. [Additional References](#additional-references)

---

## What is NestJS?

NestJS is a framework built with TypeScript that leverages modern JavaScript features to create powerful and scalable server-side applications. Key features include:

- **Modularity**: Code is organized into reusable and independent modules.
- **Flexibility**: Integrates seamlessly with other libraries and tools.
- **Comprehensive Features**: Built-in support for WebSockets, GraphQL, microservices, and more.

More information: [NestJS Official Documentation](https://docs.nestjs.com/).

---

## Installation

Install the NestJS CLI globally and create a new project:

```bash
npm install -g @nestjs/cli
nest new project-name
```

---

## Project Structure

When creating a new project, the default structure is:

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

## Modules and Dependency Injection

Modules are the organizational foundation in NestJS. Each module encapsulates a specific feature or functionality of the application.

### Example Module

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

## Controllers

Controllers handle incoming requests and return responses. They define the routes of your application.

### Example Controller

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

## Services

Services handle the business logic and can be shared across multiple controllers using dependency injection.

### Example Service

```typescript
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello, World!';
  }
}
```

---

## Pipes and Interceptors

### Pipes
Transform and validate request data before it reaches the handler.

Example:

```typescript
import { PipeTransform, Injectable, ArgumentMetadata } from '@nestjs/common';

@Injectable()
export class ValidationPipe implements PipeTransform {
  transform(value: any, metadata: ArgumentMetadata) {
    // Perform validation or transformation
    return value;
  }
}
```

### Interceptors
Customize request/response behavior.

Example:

```typescript
import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable()
export class LoggingInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    console.log('Before...');

    return next.handle().pipe(tap(() => console.log('After...')));
  }
}
```

---

## Guards and Middleware

### Guards
Guards are used for authentication and authorization.

Example:

```typescript
import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';

@Injectable()
export class AuthGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest();
    return Boolean(request.user);
  }
}
```

### Middleware
Middleware applies logic before the route handler is executed.

Example:

```typescript
import { Injectable, NestMiddleware } from '@nestjs/common';

@Injectable()
export class LoggerMiddleware implements NestMiddleware {
  use(req: any, res: any, next: () => void) {
    console.log(`${req.method} ${req.url}`);
    next();
  }
}
```

---

## Testing in NestJS

Use Jest for unit and integration testing.

### Example Unit Test

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

  it('should return "Hello, World!"', () => {
    expect(service.getHello()).toBe('Hello, World!');
  });
});
```

---

## Additional References

- [NestJS Official Documentation](https://docs.nestjs.com/)
- [NestJS GitHub Repository](https://github.com/nestjs/nest)
