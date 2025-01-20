# DTOs in NestJS: Advanced Guide

DTOs (Data Transfer Objects) define the structure of data exchanged between layers in a NestJS application. They enhance type safety, enforce validation rules, and ensure consistency in data formats. This guide explores advanced usage of DTOs with TypeORM, Sequelize, and Mongoose.

---

## Table of Contents

1. [What Are DTOs?](#what-are-dtos)
2. [Common Features for DTOs](#common-features-for-dtos)
3. [DTOs with TypeORM](#dtos-with-typeorm)
4. [DTOs with SequelizeORM](#dtos-with-sequelizeorm)
5. [DTOs with Mongoose (ODM)](#dtos-with-mongoose-odm)
6. [Comparisons](#comparisons)
7. [Advanced Tips](#advanced-tips)
8. [References](#references)

---

## What Are DTOs?

DTOs are used to:
- Enhance type safety.
- Enforce validation rules.
- Simplify serialization/deserialization for APIs.

---

## Common Features for DTOs

DTOs leverage TypeScript's strong typing and validation decorators from libraries like `class-validator` and `class-transformer`.

Example:

```typescript
import { IsString, IsInt, IsOptional } from 'class-validator';

export class CreateUserDto {
  @IsString()
  name: string;

  @IsInt()
  age: number;

  @IsOptional()
  @IsString()
  email?: string;
}
```

---

## DTOs with TypeORM

### Defining DTOs for Entity Relationships

Example:

```typescript
import { IsString, IsInt, ValidateNested } from 'class-validator';
import { Type } from 'class-transformer';

export class CreatePostDto {
  @IsString()
  title: string;

  @IsString()
  content: string;

  @ValidateNested({ each: true })
  @Type(() => CreateCommentDto)
  comments: CreateCommentDto[];
}

export class CreateCommentDto {
  @IsString()
  text: string;

  @IsInt()
  postId: number;
}
```

### Advanced Querying: Joins and Subqueries

Use TypeORM's QueryBuilder for advanced queries:

```typescript
const posts = await this.postRepository
  .createQueryBuilder('post')
  .leftJoinAndSelect('post.comments', 'comment')
  .where('post.id = :id', { id: postId })
  .getMany();
```

---

## DTOs with SequelizeORM

### Defining DTOs for Models

Example:

```typescript
import { IsString, IsInt, ValidateNested } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateCategoryDto {
  @IsString()
  name: string;

  @ValidateNested({ each: true })
  @Type(() => CreateProductDto)
  products: CreateProductDto[];
}

export class CreateProductDto {
  @IsString()
  name: string;

  @IsInt()
  categoryId: number;
}
```

### Advanced Querying: Aggregations and Groups

Sequelize offers robust aggregation support:

```typescript
const productCounts = await Product.findAll({
  attributes: [
    'categoryId',
    [Sequelize.fn('COUNT', Sequelize.col('id')), 'productCount']
  ],
  group: ['categoryId']
});
```

---

## DTOs with Mongoose (ODM)

### Using DTOs with Schemas

Example:

```typescript
import { IsString, IsOptional } from 'class-validator';

export class CreateBlogDto {
  @IsString()
  title: string;

  @IsOptional()
  @IsString()
  content?: string;
}
```

### Advanced Querying: Aggregations

Mongoose supports aggregation pipelines for complex queries:

```typescript
const results = await this.blogModel.aggregate([
  { $match: { status: 'published' } },
  { $group: { _id: '$author', totalPosts: { $sum: 1 } } }
]);
```

---

## Comparisons

| Feature                  | TypeORM                     | SequelizeORM              | Mongoose                   |
|--------------------------|-----------------------------|---------------------------|----------------------------|
| **Validation**           | Via DTOs (`class-validator`)| Via DTOs (`class-validator`)| Schema-based, DTO optional|
| **Relationships**        | Rich support via decorators| Defined in models         | Population for references |
| **Aggregations**         | Limited (via QueryBuilder) | SQL-based (raw queries)   | Full aggregation pipeline |
| **Joins**                | Native                     | Native                    | Population                 |
| **Subqueries**           | QueryBuilder               | Raw SQL                   | Limited                   |

---

## Advanced Tips

1. **Reusability:**
   Create shared DTOs for common patterns.

   ```typescript
   export class PaginationDto {
     @IsInt()
     limit: number;

     @IsInt()
     offset: number;
   }
   ```

2. **Custom Validators:**

   ```typescript
   import { registerDecorator, ValidationOptions } from 'class-validator';

   export function IsUnique(validationOptions?: ValidationOptions) {
     return function (object: Object, propertyName: string) {
       registerDecorator({
         name: 'isUnique',
         target: object.constructor,
         propertyName: propertyName,
         options: validationOptions,
         validator: {
           validate(value: any) {
             return true; // Replace with actual validation logic
           }
         }
       });
     };
   }
   ```

3. **Integration Testing:**
   Ensure DTOs work seamlessly with services and database queries.

4. **Performance Optimization:**
   Use projections and indexing to improve query efficiency.

---

## References

- [NestJS Official Documentation](https://docs.nestjs.com/)
- [TypeORM Documentation](https://typeorm.io/)
- [Sequelize Documentation](https://sequelize.org/)
- [Mongoose Documentation](https://mongoosejs.com/)
