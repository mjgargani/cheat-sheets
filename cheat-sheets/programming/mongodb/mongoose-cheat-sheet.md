# Mongoose Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet aborda o uso do Mongoose, uma biblioteca de modelagem para MongoDB, detalhando comandos essenciais, melhores práticas e abstrações pedagógicas para facilitar o aprendizado.

## Índice (pt-BR)

1. [O que é o Mongoose?](#o-que-e-o-mongoose)
2. [Instalação](#instalacao)
3. [Conectando ao MongoDB](#conectando-ao-mongodb)
4. [Definição de Esquema](#definicao-de-esquema)
5. [Operações CRUD](#operacoes-crud)
6. [Validações e Middleware](#validacoes-e-middleware)
7. [População de Dados](#populacao-de-dados)
8. [Recursos Depreciados](#recursos-depreciados)
9. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is Mongoose?](#what-is-mongoose)
2. [Installation](#installation)
3. [Connecting to MongoDB](#connecting-to-mongodb)
4. [Schema Definition](#schema-definition)
5. [CRUD Operations](#crud-operations)
6. [Validations and Middleware](#validations-and-middleware)
7. [Data Population](#data-population)
8. [Deprecated Features](#deprecated-features)
9. [Additional References](#additional-references)

---

### O que é o Mongoose? (pt-BR)

Mongoose é uma biblioteca de modelagem para MongoDB que fornece uma interface rigorosa para criar, consultar, atualizar e excluir documentos. Ele abstrai detalhes complexos do MongoDB, permitindo foco no modelo de dados.

- **Modelagem Avançada**: Crie esquemas detalhados com validação embutida.
- **Middleware Poderoso**: Execute lógica personalizada antes ou depois de ações.
- **População de Dados**: Relacione coleções com facilidade.

Mais informações: [Mongoose Docs](https://mongoosejs.com/).

### What is Mongoose? (en-US)

Mongoose is a MongoDB modeling library that provides a strict interface for creating, querying, updating, and deleting documents. It abstracts complex MongoDB details, allowing you to focus on data modeling.

- **Advanced Modeling**: Create detailed schemas with built-in validation.
- **Powerful Middleware**: Execute custom logic before or after actions.
- **Data Population**: Easily relate collections.

More information: [Mongoose Docs](https://mongoosejs.com/).

---

### Instalação (pt-BR)

```bash
npm install mongoose
```

### Installation (en-US)

```bash
npm install mongoose
```

---

### Conectando ao MongoDB (pt-BR)

```javascript
const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/my_database', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => console.log('Conectado ao MongoDB'))
  .catch((err) => console.error('Erro de conexão', err));
```

### Connecting to MongoDB (en-US)

```javascript
const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/my_database', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('Connection error', err));
```

---

### Definição de Esquema (pt-BR)

```javascript
const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  age: Number,
  createdAt: { type: Date, default: Date.now },
});
```

### Schema Definition (en-US)

```javascript
const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  age: Number,
  createdAt: { type: Date, default: Date.now },
});
```

---

### Operações CRUD (pt-BR)

**Criação**:

```javascript
const User = mongoose.model('User', userSchema);

const newUser = new User({
  name: 'João',
  email: 'joao@example.com',
  age: 30,
});

newUser.save()
  .then(user => console.log('Usuário salvo:', user))
  .catch(err => console.error('Erro ao salvar:', err));
```

**Leitura**:

```javascript
User.find()
  .then(users => console.log('Usuários:', users))
  .catch(err => console.error('Erro na consulta:', err));
```

### CRUD Operations (en-US)

**Create**:

```javascript
const User = mongoose.model('User', userSchema);

const newUser = new User({
  name: 'John',
  email: 'john@example.com',
  age: 30,
});

newUser.save()
  .then(user => console.log('User saved:', user))
  .catch(err => console.error('Save error:', err));
```

**Read**:

```javascript
User.find()
  .then(users => console.log('Users:', users))
  .catch(err => console.error('Query error:', err));
```

---

### Validações e Middleware (pt-BR)

- **Validação Customizada**:

```javascript
const userSchema = new mongoose.Schema({
  username: {
    type: String,
    validate: {
      validator: (v) => /\w{5,}/.test(v),
      message: (props) => `${props.value} não é um nome de usuário válido!`,
    },
    required: [true, 'Nome de usuário é obrigatório'],
  },
});
```

### Validations and Middleware (en-US)

- **Custom Validation**:

```javascript
const userSchema = new mongoose.Schema({
  username: {
    type: String,
    validate: {
      validator: (v) => /\w{5,}/.test(v),
      message: (props) => `${props.value} is not a valid username!`,
    },
    required: [true, 'Username is required'],
  },
});
```

---

### População de Dados (pt-BR)

```javascript
const postSchema = new mongoose.Schema({
  title: String,
  author: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
});

const Post = mongoose.model('Post', postSchema);
Post.find().populate('author').exec();
```

### Data Population (en-US)

```javascript
const postSchema = new mongoose.Schema({
  title: String,
  author: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
});

const Post = mongoose.model('Post', postSchema);
Post.find().populate('author').exec();
```

---

### Recursos Depreciados (pt-BR)

Consulte os recursos obsoletos na [documentação oficial do Mongoose](https://mongoosejs.com/docs/).

### Deprecated Features (en-US)

Refer to deprecated features in the [official Mongoose documentation](https://mongoosejs.com/docs/).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do Mongoose](https://mongoosejs.com/docs/)
- [Validações no Mongoose](https://mongoosejs.com/docs/validation.html)

### Additional References (en-US)

- [Mongoose Official Documentation](https://mongoosejs.com/docs/)
- [Mongoose Validations](https://mongoosejs.com/docs/validation.html)
