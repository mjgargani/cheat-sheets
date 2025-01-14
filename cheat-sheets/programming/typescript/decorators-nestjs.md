# Decorators no TypeScript e Custom Decorators no NestJS (2025)

## Introdução
Decorators são uma funcionalidade avançada do TypeScript que permitem anotar e modificar classes, métodos, propriedades ou parâmetros. Eles são amplamente utilizados no framework **NestJS** para construir APIs modulares e reutilizáveis.

---

## Habilitando Decorators
Certifique-se de que os **decorators** e os **metadata reflection APIs** estão habilitados no `tsconfig.json`:

```json
{
  "compilerOptions": {
    "experimentalDecorators": true,
    "emitDecoratorMetadata": true
  }
}
```

---

## Tipos de Decorators no TypeScript

1. **Class Decorator**
   Usado para anotar ou modificar classes.

   ```typescript
   function Injectable(target: Function) {
     console.log(`Class ${target.name} is injectable`);
   }

   @Injectable
   class Example {}
   ```

2. **Method Decorator**
   Executa lógica em métodos.

   ```typescript
   function LogMethod(target: Object, key: string | symbol, descriptor: PropertyDescriptor) {
     const originalMethod = descriptor.value;
     descriptor.value = function (...args: any[]) {
       console.log(`Calling ${String(key)} with`, args);
       return originalMethod.apply(this, args);
     };
   }

   class Example {
     @LogMethod
     sayHello(name: string) {
       return `Hello, ${name}`;
     }
   }
   ```

3. **Property Decorator**
   Anota propriedades.

   ```typescript
   function LogProperty(target: Object, key: string | symbol) {
     let value = target[key];

     Object.defineProperty(target, key, {
       get: () => value,
       set: (newValue) => {
         console.log(`Setting ${String(key)} to ${newValue}`);
         value = newValue;
       }
     });
   }

   class Example {
     @LogProperty
     name: string;
   }
   ```

4. **Parameter Decorator**
   Anota os parâmetros de métodos.

   ```typescript
   function LogParameter(target: Object, key: string | symbol, index: number) {
     console.log(`Parameter ${index} of ${String(key)} is decorated`);
   }

   class Example {
     greet(@LogParameter name: string) {
       return `Hello, ${name}`;
     }
   }
   ```

---

## Decorators no NestJS

1. **Custom Class Decorator**
   ```typescript
   import { Injectable } from '@nestjs/common';

   function CustomDecorator() {
     return function (target: Function) {
       console.log(`Class ${target.name} has been decorated`);
     };
   }

   @Injectable()
   @CustomDecorator()
   export class MyService {}
   ```

2. **Custom Method Decorator**
   ```typescript
   import { SetMetadata } from '@nestjs/common';

   export const Roles = (...roles: string[]) => SetMetadata('roles', roles);

   @Controller('users')
   export class UserController {
     @Get()
     @Roles('admin')
     findAll() {
       return [];
     }
   }
   ```

3. **Custom Parameter Decorator**
   ```typescript
   import { createParamDecorator, ExecutionContext } from '@nestjs/common';

   export const User = createParamDecorator((data: string, ctx: ExecutionContext) => {
     const request = ctx.switchToHttp().getRequest();
     return data ? request.user?.[data] : request.user;
   });

   @Controller('profile')
   export class ProfileController {
     @Get()
     getProfile(@User('email') email: string) {
       return { email };
     }
   }
   ```

4. **Custom Property Decorator**
   ```typescript
   import 'reflect-metadata';

   function Field(metadata: any) {
     return Reflect.metadata('custom:field', metadata);
   }

   class Example {
     @Field({ description: 'The name of the user' })
     name: string;
   }
   ```

---

## Recursos Avançados

### Metadata Reflection API
Utilize `Reflect` para manipular metadados:
```typescript
import 'reflect-metadata';

function Meta(key: string, value: any) {
  return Reflect.metadata(key, value);
}

class Example {
  @Meta('role', 'admin')
  role: string;
}

const metadata = Reflect.getMetadata('role', Example.prototype, 'role');
console.log(metadata); // admin
```

### Composição de Decorators
Combine múltiplos decorators:
```typescript
function Logger() {
  return function (target: any, key: string) {
    console.log(`${key} was called`);
  };
}

function Timing() {
  return function (target: any, key: string, descriptor: PropertyDescriptor) {
    const original = descriptor.value;
    descriptor.value = function (...args: any[]) {
      console.time(key);
      const result = original.apply(this, args);
      console.timeEnd(key);
      return result;
    };
  };
}

class Example {
  @Logger()
  @Timing()
  compute() {
    return 'done';
  }
}
```

---

## Fontes e Referências
- [TypeScript Decorators](https://www.typescriptlang.org/docs/handbook/decorators.html)
- [NestJS Documentation](https://docs.nestjs.com/custom-decorators)
- [Reflect Metadata](https://rbuckton.github.io/reflect-metadata/)