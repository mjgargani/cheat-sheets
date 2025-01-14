### **DTOs e Relacionamentos - Cheat Sheet (2025)**

#### **O que são DTOs?**
DTO (Data Transfer Object) é um padrão usado para transportar dados entre diferentes camadas de uma aplicação. Ele ajuda a:
- Reduzir o acoplamento entre camadas.
- Garantir que apenas os dados necessários sejam transmitidos.
- Facilitar a serialização/deserialização para APIs.

---

#### **Estrutura Geral de DTO**
```typescript
// Exemplo em TypeScript (NestJS)
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

#### **Relacionamentos em Bancos de Dados**
Relacionamentos indicam como as tabelas ou coleções estão conectadas. Eles variam dependendo se o banco de dados é relacional ou não-relacional.

##### **Relacional (SQL)**

1. **One-to-One**
   - Cada registro em uma tabela está associado a um único registro em outra tabela.
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
   - Um registro em uma tabela está associado a vários registros em outra tabela.
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
   - Uma tabela intermediária é usada para gerenciar a relação entre duas tabelas.
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

##### **Não-relacional (NoSQL)**

1. **One-to-One**
   - Normalmente armazenado no mesmo documento.
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
   - Incorporado ou referenciado.
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

   Ou usando referências:
   ```json
   {
       "userId": "1",
       "name": "John Doe",
       "orderIds": ["101", "102"]
   }
   ```

3. **Many-to-Many**
   - Usando arrays de IDs.
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

#### **Mapeamento DTO-Entidade**
- **Relacional (ORM - TypeORM, Sequelize):**
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

- **Não-relacional (ODM - Mongoose):**
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

#### **Dicas Avançadas**

1. **Evitar Leitura Excessiva**
   - Use **projection** no MongoDB ou selecione colunas específicas em SQL.
   ```typescript
   // MongoDB
   User.find({}, 'name email');

   // SQL
   SELECT name, email FROM users;
   ```

2. **Validação**
   - Utilize bibliotecas como **class-validator** para validação de DTOs.
   ```typescript
   import { IsString, IsEmail } from 'class-validator';

   export class CreateUserDTO {
       @IsString()
       readonly name: string;

       @IsEmail()
       readonly email: string;
   }
   ```

3. **Transformação**
   - Converta DTOs em entidades utilizando bibliotecas como **class-transformer**.
   ```typescript
   import { plainToInstance } from 'class-transformer';

   const userEntity = plainToInstance(User, createUserDTO);
   ```

4. **Normalização de Dados**
   - Para gráficos complexos em relações, considere normalizar os dados antes de expor via APIs.

---

#### **Recursos e Referências**
- [TypeORM Documentation](https://typeorm.io/)
- [Mongoose Documentation](https://mongoosejs.com/)
- [NestJS DTOs](https://docs.nestjs.com/controllers#request-payloads)
- [MongoDB Relationships](https://www.mongodb.com/docs/manual/tutorial/model-referenced-one-to-many-relationships-between-documents/)
