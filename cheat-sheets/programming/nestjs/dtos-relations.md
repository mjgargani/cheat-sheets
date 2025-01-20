### **DTOs and Relationships - Cheat Sheet (2025)**

#### **What are DTOs?**
Data Transfer Objects (DTOs) are design patterns used to transfer data between different layers of an application. They help:
- Reduce coupling between layers.
- Ensure only necessary data is transmitted.
- Simplify serialization/deserialization for APIs.

---

#### **General DTO Structure**

```typescript
// Example in TypeScript (NestJS)
export class CreateUserDTO {
  readonly name: string;
  readonly email: string;
  readonly password: string;
}

export class UserResponseDTO {
  readonly id: string;
  readonly name: string;
  readonly email: string;
  readonly createdAt: Date;
}
```

---

#### **Database Relationships**
Relationships define how tables or collections are connected. The implementation varies between relational and non-relational databases.

##### **Relational (SQL)**

1. **One-to-One**
   Each record in one table is associated with exactly one record in another table.

   ```sql
   CREATE TABLE users (
       id INT PRIMARY KEY,
       name VARCHAR(255)
   );

   CREATE TABLE profiles (
       id INT PRIMARY KEY,
       user_id INT UNIQUE,
       bio TEXT,
       FOREIGN KEY (user_id) REFERENCES users(id)
   );
   ```

2. **One-to-Many**
   One record in a table is associated with multiple records in another table.

   ```sql
   CREATE TABLE users (
       id INT PRIMARY KEY,
       name VARCHAR(255)
   );

   CREATE TABLE orders (
       id INT PRIMARY KEY,
       user_id INT,
       product VARCHAR(255),
       FOREIGN KEY (user_id) REFERENCES users(id)
   );
   ```

3. **Many-to-Many**
   An intermediary table manages the relationship between two tables.

   ```sql
   CREATE TABLE students (
       id INT PRIMARY KEY,
       name VARCHAR(255)
   );

   CREATE TABLE courses (
       id INT PRIMARY KEY,
       title VARCHAR(255)
   );

   CREATE TABLE student_courses (
       student_id INT,
       course_id INT,
       FOREIGN KEY (student_id) REFERENCES students(id),
       FOREIGN KEY (course_id) REFERENCES courses(id),
       PRIMARY KEY (student_id, course_id)
   );
   ```

##### **Non-relational (NoSQL)**

1. **One-to-One**
   Typically stored in the same document.

   ```json
   {
       "userId": "1",
       "name": "John Doe",
       "profile": {
           "bio": "Software Engineer",
           "website": "johndoe.dev"
       }
   }
   ```

2. **One-to-Many**
   Embedded or referenced.

   **Embedded Example:**
   ```json
   {
       "userId": "1",
       "name": "John Doe",
       "orders": [
           { "orderId": "101", "product": "Laptop" },
           { "orderId": "102", "product": "Mouse" }
       ]
   }
   ```

   **Referenced Example:**
   ```json
   {
       "userId": "1",
       "name": "John Doe",
       "orderIds": ["101", "102"]
   }
   ```

3. **Many-to-Many**
   Using arrays of IDs.

   ```json
   {
       "studentId": "1",
       "name": "Alice",
       "courseIds": ["201", "202"]
   }

   {
       "courseId": "201",
       "title": "Math 101",
       "studentIds": ["1", "2"]
   }
   ```

---

#### **Mapping DTO to Entity**

- **Relational (ORM - TypeORM, Sequelize):**
  ```typescript
  @Entity()
  export class User {
      @PrimaryGeneratedColumn()
      id: number;

      @Column()
      name: string;

      @Column()
      email: string;

      @OneToMany(() => Order, (order) => order.user)
      orders: Order[];
  }

  @Entity()
  export class Order {
      @PrimaryGeneratedColumn()
      id: number;

      @ManyToOne(() => User, (user) => user.orders)
      user: User;

      @Column()
      product: string;
  }
  ```

- **Non-relational (ODM - Mongoose):**
  ```typescript
  const UserSchema = new Schema({
      name: { type: String, required: true },
      email: { type: String, required: true },
      orders: [{ type: Schema.Types.ObjectId, ref: 'Order' }]
  });

  const OrderSchema = new Schema({
      product: { type: String, required: true },
      user: { type: Schema.Types.ObjectId, ref: 'User' }
  });
  ```

---

#### **Advanced Tips**

1. **Avoid Over-fetching**
   Use projections in MongoDB or select specific columns in SQL.

   ```typescript
   // MongoDB
   User.find({}, 'name email');

   // SQL
   SELECT name, email FROM users;
   ```

2. **Validation**
   Use libraries like **class-validator** for validating DTOs.

   ```typescript
   import { IsString, IsEmail } from 'class-validator';

   export class CreateUserDTO {
       @IsString()
       readonly name: string;

       @IsEmail()
       readonly email: string;
   }
   ```

3. **Transformation**
   Convert DTOs into entities using libraries like **class-transformer**.

   ```typescript
   import { plainToInstance } from 'class-transformer';

   const userEntity = plainToInstance(User, createUserDTO);
   ```

4. **Data Normalization**
   For complex relationship graphs, consider normalizing data before exposing it through APIs.

---

#### **Resources and References**
- [TypeORM Documentation](https://typeorm.io/)
- [Mongoose Documentation](https://mongoosejs.com/)
- [NestJS DTOs](https://docs.nestjs.com/controllers#request-payloads)
- [MongoDB Relationships](https://www.mongodb.com/docs/manual/tutorial/model-referenced-one-to-many-relationships-between-documents/)
