# DTOs no NestJS: Guia Definitivo (2025)

## O que são DTOs?

**Data Transfer Objects (DTOs)** são objetos usados para transferir dados entre diferentes camadas de uma aplicação, garantindo validação, consistência e segurança. No NestJS, DTOs são amplamente utilizados para:

- Validar dados de entrada em controladores e serviços.
- Garantir a tipagem estática e consistência de dados.
- Simplificar a lógica de negócios e aumentar a manutenibilidade do código.

---

## Configuração Básica

### Instalação de Dependências

Para usar DTOs com validação e transformação de dados:

```bash
npm install class-validator class-transformer
```

### Configuração do ValidationPipe no `main.ts`

Habilite a validação global no pipeline de requisições:

```typescript
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // Remove propriedades não declaradas no DTO
      forbidNonWhitelisted: true, // Rejeita solicitações com propriedades extras
      transform: true, // Transforma dados para os tipos esperados no DTO
    }),
  );

  await app.listen(3000);
}
bootstrap();
```

---

## Criando DTOs

### DTO Básico

Um exemplo simples de DTO para criação de usuários:

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

### DTO com Validação Aninhada

Valide objetos dentro de outros objetos:

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

### DTO com Parâmetros Opcionais

Use `@IsOptional()` para campos opcionais:

```typescript
import { IsString, IsOptional } from 'class-validator';

export class UpdateUserDto {
  @IsOptional()
  @IsString()
  name?: string;
}
```

---

## Integração com ORMs e ODMs

### TypeORM

#### Definindo DTOs e Entidades

```typescript
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { IsString, IsInt } from 'class-validator';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @IsString()
  name: string;

  @Column()
  @IsInt()
  age: number;
}
```

#### Transformando DTOs em Entidades

Use `plainToInstance` para converter um DTO em uma entidade:

```typescript
import { plainToInstance } from 'class-transformer';
import { CreateUserDto } from './create-user.dto';
import { User } from './user.entity';

const dto = new CreateUserDto();
dto.name = 'John';
dto.age = 30;

const userEntity = plainToInstance(User, dto);
```

### Sequelize ORM

#### Mapeando DTOs para Models

```typescript
import { Table, Column, Model, DataType } from 'sequelize-typescript';
import { IsString, IsInt } from 'class-validator';

@Table
export class User extends Model {
  @Column({ type: DataType.STRING })
  @IsString()
  name: string;

  @Column({ type: DataType.INTEGER })
  @IsInt()
  age: number;
}
```

### Mongoose (ODM para MongoDB)

#### Definindo Schemas e DTOs

```typescript
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';

export type UserDocument = HydratedDocument<User>;

@Schema()
export class User {
  @Prop({ required: true })
  name: string;

  @Prop({ required: true, min: 18, max: 100 })
  age: number;
}

export const UserSchema = SchemaFactory.createForClass(User);
```

---

## Recursos Avançados

### Validação Customizada

Crie decoradores personalizados para validação:

```typescript
import { registerDecorator, ValidationOptions, ValidationArguments } from 'class-validator';

export function IsPositiveInteger(validationOptions?: ValidationOptions) {
  return function (object: Object, propertyName: string) {
    registerDecorator({
      name: 'isPositiveInteger',
      target: object.constructor,
      propertyName,
      options: validationOptions,
      validator: {
        validate(value: any, args: ValidationArguments) {
          return Number.isInteger(value) && value > 0;
        },
      },
    });
  };
}
```

Uso:

```typescript
export class ProductDto {
  @IsPositiveInteger({ message: 'O preço deve ser um número inteiro positivo!' })
  price: number;
}
```

### Transformação Automática

Transforme valores automaticamente:

```typescript
import { Transform } from 'class-transformer';

export class CreateUserDto {
  @Transform(({ value }) => value.toLowerCase())
  @IsString()
  email: string;
}
```

### Documentação com Swagger

Gere documentação automaticamente para seus DTOs:

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

## Comparação entre ORMs/ODMs

| Recurso                 | TypeORM                     | SequelizeORM              | Mongoose                   |
|-------------------------|-----------------------------|---------------------------|----------------------------|
| **Validação**           | Via DTOs (`class-validator`)| Via DTOs (`class-validator`)| Schema-based, DTO opcional|
| **Relacionamentos**     | Rico suporte via decorators| Definido em models        | Population para referências|
| **Agregações**          | Limitado (via QueryBuilder) | SQL-based (raw queries)   | Full aggregation pipeline |
| **Joins**               | Nativo                     | Nativo                    | Population                 |
| **Subqueries**          | QueryBuilder               | Raw SQL                   | Limitado                   |

---

## Referências

- [NestJS Documentation](https://docs.nestjs.com/)
- [class-validator GitHub](https://github.com/typestack/class-validator)
- [class-transformer GitHub](https://github.com/typestack/class-transformer)
- [TypeORM Documentation](https://typeorm.io/)
- [Sequelize Documentation](https://sequelize.org/)
- [Mongoose Documentation](https://mongoosejs.com/)

---

_Última atualização: Janeiro de 2025_
