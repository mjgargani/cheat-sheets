# DTOs no NestJS: Cheat Sheet Avançado (2025)

## O que é um DTO (Data Transfer Object)?

Um **DTO** é um objeto usado para transferir dados entre processos, garantindo a validação, tipagem e estrutura dos dados em sua aplicação. No NestJS, são comumente usados para validar dados de entrada e saída de APIs.

---

## Configuração Base para DTOs

### Instale as dependências necessárias

```bash
npm install --save class-validator class-transformer
```

Adicione os pacotes de validação (`class-validator`) e transformação de objetos (`class-transformer`) para criar DTOs eficazes.

### Habilite validação global no `main.ts`

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

## Estrutura de um DTO

### Criação de um DTO Simples

```typescript
import { IsString, IsInt, Min, Max } from 'class-validator';

export class CreateUserDto {
  @IsString()
  name: string;

  @IsInt()
  @Min(18)
  @Max(100)
  age: number;
}
```

### Tipos de Validações Comuns

| Decorador        | Descrição                                      |
|------------------|------------------------------------------------|
| `@IsString()`    | Garante que o valor é uma string.             |
| `@IsInt()`       | Garante que o valor é um número inteiro.      |
| `@IsEmail()`     | Valida se é um e-mail válido.                 |
| `@IsOptional()`  | Permite que o campo seja opcional.            |
| `@IsArray()`     | Garante que o valor é um array.               |
| `@ValidateNested()` | Valida objetos aninhados com outro DTO.    |

---

## Integração com TypeORM

### Usando DTOs com TypeORM Entities

```typescript
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  age: number;
}
```

#### Transformando DTO em Entidade

```typescript
import { plainToInstance } from 'class-transformer';
import { CreateUserDto } from './create-user.dto';
import { User } from './user.entity';

const dto = new CreateUserDto();
dto.name = 'John';
dto.age = 30;

const userEntity = plainToInstance(User, dto);
```

---

## Integração com Sequelize ORM

### Criação do Model

```typescript
import { Table, Column, Model, DataType } from 'sequelize-typescript';

@Table
export class User extends Model {
  @Column({ type: DataType.STRING })
  name: string;

  @Column({ type: DataType.INTEGER })
  age: number;
}
```

#### Mapeando DTO para Model

```typescript
import { CreateUserDto } from './create-user.dto';
import { User } from './user.model';

const createUserDto: CreateUserDto = { name: 'John', age: 30 };
const user = User.build(createUserDto);
await user.save();
```

---

## Integração com Mongoose (ODM para MongoDB)

### Definição do Schema

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

#### Aplicando DTO para Document

```typescript
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { CreateUserDto } from './create-user.dto';
import { User, UserDocument } from './user.schema';

@Injectable()
export class UserService {
  constructor(@InjectModel(User.name) private userModel: Model<UserDocument>) {}

  async create(createUserDto: CreateUserDto): Promise<User> {
    const createdUser = new this.userModel(createUserDto);
    return createdUser.save();
  }
}
```

---

## Recursos Avançados

### DTOs Aninhados

```typescript
import { Type } from 'class-transformer';
import { ValidateNested, IsString } from 'class-validator';

export class AddressDto {
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

### Validação Customizada

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

// Uso
export class CreateUserDto {
  @IsPositiveInteger({ message: 'Age must be a positive integer' })
  age: number;
}
```

---

## Referências

- [NestJS Documentation - Pipes](https://docs.nestjs.com/pipes)
- [class-validator GitHub](https://github.com/typestack/class-validator)
- [class-transformer GitHub](https://github.com/typestack/class-transformer)
- [TypeORM Documentation](https://typeorm.io/)
- [Sequelize Documentation](https://sequelize.org/)
- [Mongoose Documentation](https://mongoosejs.com/)
