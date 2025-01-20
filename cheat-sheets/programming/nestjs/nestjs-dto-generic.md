# DTOs in NestJS: Definitive Guide

## What Are DTOs?

**Data Transfer Objects (DTOs)** are objects used to transfer data between different layers of an application. In NestJS, DTOs play a key role in:

- Validating input data in controllers and services.
- Ensuring static typing and data consistency.
- Simplifying business logic and improving code maintainability.

---

## Basic Configuration

### Installing Dependencies

To use DTOs with validation and data transformation:

```bash
npm install class-validator class-transformer
```

### Configuring ValidationPipe in `main.ts`

Enable global validation in the request pipeline:

```typescript
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // Removes undefined properties
      forbidNonWhitelisted: true, // Rejects extra properties
      transform: true, // Transforms data into expected DTO types
    }),
  );

  await app.listen(3000);
}
bootstrap();
```

---

## Creating DTOs

### Basic DTO

A simple example of a DTO for creating users:

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

### DTO with Nested Validation

Validate objects within other objects:

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

### DTO with Optional Parameters

Use `@IsOptional()` for optional fields:

```typescript
import { IsString, IsOptional } from 'class-validator';

export class UpdateUserDto {
  @IsOptional()
  @IsString()
  name?: string;
}
```

---

## Integration with ORMs and ODMs

### TypeORM

#### Defining DTOs and Entities

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

#### Transforming DTOs into Entities

Use `plainToInstance` to convert a DTO into an entity:

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

#### Mapping DTOs to Models

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

### Mongoose (ODM for MongoDB)

#### Defining Schemas and DTOs

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

## Advanced Features

### Custom Validation

Create custom validation decorators:

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

Usage:

```typescript
export class ProductDto {
  @IsPositiveInteger({ message: 'Price must be a positive integer!' })
  price: number;
}
```

### Automatic Transformation

Transform values automatically:

```typescript
import { Transform } from 'class-transformer';

export class CreateUserDto {
  @Transform(({ value }) => value.toLowerCase())
  @IsString()
  email: string;
}
```

### Documentation with Swagger

Generate documentation automatically for your DTOs:

```typescript
import { ApiProperty } from '@nestjs/swagger';

export class CreateUserDto {
  @ApiProperty({ description: 'Name of the user' })
  name: string;

  @ApiProperty({ description: 'Age of the user', minimum: 18, maximum: 100 })
  age: number;
}
```

Install Swagger:

```bash
npm install @nestjs/swagger swagger-ui-express
```

---

## Comparison Between ORMs/ODMs

| Feature                  | TypeORM                     | SequelizeORM              | Mongoose                   |
|--------------------------|-----------------------------|---------------------------|----------------------------|
| **Validation**           | Via DTOs (`class-validator`)| Via DTOs (`class-validator`)| Schema-based, DTO optional|
| **Relationships**        | Rich support via decorators| Defined in models         | Population for references |
| **Aggregations**         | Limited (via QueryBuilder) | SQL-based (raw queries)   | Full aggregation pipeline |
| **Joins**                | Native                     | Native                    | Population                 |
| **Subqueries**           | QueryBuilder               | Raw SQL                   | Limited                   |

---

## References

- [NestJS Documentation](https://docs.nestjs.com/)
- [class-validator GitHub](https://github.com/typestack/class-validator)
- [class-transformer GitHub](https://github.com/typestack/class-transformer)
- [TypeORM Documentation](https://typeorm.io/)
- [Sequelize Documentation](https://sequelize.org/)
- [Mongoose Documentation](https://mongoosejs.com/)
