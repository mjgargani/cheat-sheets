### DTOs in NestJS - Cheat Sheet (2025)

#### What Are DTOs?
- **Data Transfer Objects (DTOs)** are objects used to transfer data between different layers of an application, ensuring validation, consistency, and security.
- In NestJS, DTOs are used to:
  - Validate incoming data.
  - Define contracts between controllers and services.
  - Improve code organization and maintainability.

---

### Creating DTOs in NestJS

#### 1. Install Required Dependencies
```bash
npm install class-validator class-transformer
```

#### 2. Define a Basic DTO
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

### Advanced Features

#### 1. **Nested Validation**
- To validate objects within objects:
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

#### 2. **Optional Parameters**
- Use decorators like `@IsOptional()` to make fields optional.
```typescript
import { IsString, IsOptional } from 'class-validator';

export class UpdateUserDto {
  @IsOptional()
  @IsString()
  name?: string;
}
```

#### 3. **Automatic Transformation**
- Use `@Transform` to modify values automatically:
```typescript
import { Transform } from 'class-transformer';

export class CreateUserDto {
  @Transform(({ value }) => value.toLowerCase())
  @IsString()
  email: string;
}
```

#### 4. **Whitelist and ForbidUnknownValues**
- Configure `ValidationPipe` to remove unknown properties or throw errors:
```typescript
import { ValidationPipe } from '@nestjs/common';

app.useGlobalPipes(new ValidationPipe({
  whitelist: true, // Removes undefined properties
  forbidNonWhitelisted: true, // Throws error for unknown properties
}));
```

---

### Best Practices

1. **Segregate DTOs by Context**
   - Create specific DTOs for different operations (e.g., `CreateUserDto`, `UpdateUserDto`).

2. **Custom Validation**
   - Create custom decorators for specific rules:
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

   Usage:
   ```typescript
   import { IsPositive } from './custom-decorators';

   export class ProductDto {
     @IsPositive({ message: 'Value must be positive!' })
     price: number;
   }
   ```

3. **Documentation with Swagger**
   - Automatically generate documentation for DTOs:
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

### References
- [NestJS Documentation - Pipes](https://docs.nestjs.com/pipes)
- [Class Validator GitHub](https://github.com/typestack/class-validator)
- [Class Transformer GitHub](https://github.com/typestack/class-transformer)
- [NestJS Swagger](https://docs.nestjs.com/openapi/introduction)
