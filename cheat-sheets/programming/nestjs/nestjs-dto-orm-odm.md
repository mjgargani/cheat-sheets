# DTOs in NestJS: Advanced Guide (2025)

## What Are DTOs?
DTOs (Data Transfer Objects) are objects that define the structure of data exchanged between layers in a NestJS application. They:

- Enhance type safety.
- Enforce validation rules.
- Ensure consistency in data formats.

## Common Features for DTOs
- Use of **TypeScript interfaces or classes** for strong typing.
- **Validation decorators** from `class-validator` and `class-transformer`.

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
DTOs can map to entities, including relationships (e.g., one-to-many, many-to-many).

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

TypeORM supports advanced joins using the QueryBuilder:

```typescript
const posts = await this.postRepository
  .createQueryBuilder("post")
  .leftJoinAndSelect("post.comments", "comment")
  .where("post.id = :id", { id: postId })
  .getMany();
```

---

## DTOs with SequelizeORM

### Defining DTOs for Models
DTOs align with Sequelize models. Relationships are defined in models and referenced in DTOs.

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

Sequelize offers aggregation and grouping:

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

Mongoose schemas define relationships and validation. DTOs are mapped accordingly.

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

Aggregation pipelines in Mongoose offer powerful querying:

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

1. **Reusability:** Create shared DTOs for common patterns.
   ```typescript
   export class PaginationDto {
     @IsInt()
     limit: number;

     @IsInt()
     offset: number;
   }
   ```

2. **Custom Validators:** Use custom validation logic.
   ```typescript
   import { registerDecorator, ValidationOptions, ValidationArguments } from 'class-validator';

   export function IsUnique(validationOptions?: ValidationOptions) {
     return function (object: Object, propertyName: string) {
       registerDecorator({
         name: 'isUnique',
         target: object.constructor,
         propertyName: propertyName,
         options: validationOptions,
         validator: {
           async validate(value: any, args: ValidationArguments) {
             // Custom validation logic
             return true; // or false
           }
         }
       });
     };
   }
   ```

3. **Integration Testing:** Ensure DTOs work well with services and database queries.

4. **Performance Considerations:** Optimize queries with projections and indexes for large datasets.

---

## References

- [NestJS Official Documentation](https://docs.nestjs.com/)
- [TypeORM Documentation](https://typeorm.io/)
- [Sequelize Documentation](https://sequelize.org/)
- [Mongoose Documentation](https://mongoosejs.com/)

---

_Last updated: January 2025_
