# Advanced DTOs in NestJS Cheat Sheet

Data Transfer Objects (DTOs) are essential in NestJS for validating and structuring input and output data within applications. This guide provides advanced insights into using DTOs effectively with various ORMs and advanced validation techniques.

---

## What is a DTO (Data Transfer Object)?

A **DTO** is an object used to transfer data between layers or processes. In NestJS, DTOs are primarily used to validate and structure input data in APIs. They help ensure data consistency, enforce types, and reduce redundancy.

---

## Base Configuration for DTOs

### Install Required Dependencies

```bash
npm install --save class-validator class-transformer
```

The `class-validator` package validates data, while `class-transformer` handles data transformation.

### Enable Global Validation in `main.ts`

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
      transform: true, // Converts input data to the expected DTO type
    }),
  );

  await app.listen(3000);
}
bootstrap();
```

---

## DTO Structure

### Creating a Simple DTO

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

### Common Validation Decorators

| Decorator             | Description                                |
|-----------------------|--------------------------------------------|
| `@IsString()`         | Ensures the value is a string.             |
| `@IsInt()`            | Ensures the value is an integer.           |
| `@IsEmail()`          | Validates the value as a proper email.     |
| `@IsOptional()`       | Marks the field as optional.               |
| `@IsArray()`          | Ensures the value is an array.             |
| `@ValidateNested()`   | Validates nested objects using other DTOs. |

---

## Integration with TypeORM

### Using DTOs with TypeORM Entities

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

#### Transforming DTO into Entity

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

## Integration with Sequelize ORM

### Defining a Model

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

#### Mapping DTO to Model

```typescript
import { CreateUserDto } from './create-user.dto';
import { User } from './user.model';

const createUserDto: CreateUserDto = { name: 'John', age: 30 };
const user = User.build(createUserDto);
await user.save();
```

---

## Integration with Mongoose (ODM for MongoDB)

### Defining the Schema

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

#### Applying DTO to Document

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

## Advanced Features

### Nested DTOs

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

### Custom Validation

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

// Usage
export class CreateUserDto {
  @IsPositiveInteger({ message: 'Age must be a positive integer' })
  age: number;
}
```

---

## References

- [NestJS Documentation - Pipes](https://docs.nestjs.com/pipes)
- [class-validator GitHub](https://github.com/typestack/class-validator)
- [class-transformer GitHub](https://github.com/typestack/class-transformer)
- [TypeORM Documentation](https://typeorm.io/)
- [Sequelize Documentation](https://sequelize.org/)
- [Mongoose Documentation](https://mongoosejs.com/)
