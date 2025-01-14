### DTOs no NestJS - Cheat Sheet (2025)

#### O que são DTOs?
- **Data Transfer Objects (DTOs)** são objetos usados para transferir dados entre diferentes camadas de uma aplicação, garantindo validação, consistência e segurança.
- No NestJS, são usados para:
  - Validar a entrada de dados.
  - Definir contratos entre controladores e serviços.
  - Melhorar a organização e a manutenibilidade do código.

---

### Criando DTOs no NestJS

#### 1. Instalar Dependências Necessárias
```bash
npm install class-validator class-transformer
```

#### 2. Definir um DTO Básico
```typescript
import { IsString, IsInt, Min, Max } from 'class-validator';

export class CreateUserDto {
  @IsString()
  readonly name: string;

  @IsInt()
  @Min(18)
  @Max(100)
  readonly age: number;
}
```

---

### Recursos Avançados

#### 1. **Validação Aninhada**
- Para validar objetos dentro de objetos:
```typescript
import { Type } from 'class-transformer';
import { ValidateNested, IsString } from 'class-validator';

class AddressDto {
  @IsString()
  street: string;

  @IsString()
  city: string;
}

export class CreateUserDto {
  @IsString()
  name: string;

  @ValidateNested()
  @Type(() => AddressDto)
  address: AddressDto;
}
```

#### 2. **Parâmetros Opcionais**
- Use decoradores como `@IsOptional()` para tornar campos opcionais.
```typescript
import { IsString, IsOptional } from 'class-validator';

export class UpdateUserDto {
  @IsOptional()
  @IsString()
  name?: string;
}
```

#### 3. **Transformação Automática**
- Use `@Transform` para modificar valores automaticamente:
```typescript
import { Transform } from 'class-transformer';

export class CreateUserDto {
  @Transform(({ value }) => value.toLowerCase())
  @IsString()
  email: string;
}
```

#### 4. **Whitelist e ForbidUnknownValues**
- Configurar `ValidationPipe` para remover propriedades desconhecidas ou lançar erros:
```typescript
import { ValidationPipe } from '@nestjs/common';

app.useGlobalPipes(new ValidationPipe({
  whitelist: true, // Remove propriedades não definidas no DTO
  forbidNonWhitelisted: true, // Lança erro para propriedades não definidas
}));
```

---

### Práticas Recomendadas

1. **Segregar DTOs por Contexto**
   - Crie DTOs específicos para diferentes operações (ex.: `CreateUserDto`, `UpdateUserDto`).

2. **Validação Customizada**
   - Crie decoradores personalizados para regras específicas:
   ```typescript
   import { registerDecorator, ValidationOptions, ValidationArguments } from 'class-validator';

   export function IsPositive(validationOptions?: ValidationOptions) {
     return function (object: Object, propertyName: string) {
       registerDecorator({
         name: 'isPositive',
         target: object.constructor,
         propertyName: propertyName,
         options: validationOptions,
         validator: {
           validate(value: any, args: ValidationArguments) {
             return typeof value === 'number' && value > 0;
           },
         },
       });
     };
   }
   ```

   Uso:
   ```typescript
   import { IsPositive } from './custom-decorators';

   export class ProductDto {
     @IsPositive({ message: 'O valor deve ser positivo!' })
     price: number;
   }
   ```

3. **Documentação com Swagger**
   - Para gerar automaticamente a documentação dos DTOs:
   ```typescript
   import { ApiProperty } from '@nestjs/swagger';

   export class CreateUserDto {
     @ApiProperty({ description: 'Nome do usuário' })
     name: string;

     @ApiProperty({ description: 'Idade do usuário', minimum: 18, maximum: 100 })
     age: number;
   }
   ```

   Instale o Swagger no projeto:
   ```bash
   npm install @nestjs/swagger swagger-ui-express
   ```

---

### Fontes e Referências
- [Documentação Oficial do NestJS - Pipes](https://docs.nestjs.com/pipes)
- [Class Validator GitHub](https://github.com/typestack/class-validator)
- [Class Transformer GitHub](https://github.com/typestack/class-transformer)
- [NestJS Swagger](https://docs.nestjs.com/openapi/introduction)
