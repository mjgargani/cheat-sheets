# Mongoose Cheat Sheet

Mongoose is a MongoDB modeling library that provides a strict interface for creating, querying, updating, and deleting documents. This cheat sheet covers essential commands, best practices, and abstractions to simplify data modeling and application development.

---

## Table of Contents

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

## What is Mongoose?

Mongoose is designed to simplify interactions with MongoDB, providing schema-based data modeling and abstraction for document management.

- **Advanced Modeling**: Create detailed schemas with built-in validation.
- **Powerful Middleware**: Execute custom logic before or after database actions.
- **Data Population**: Easily reference and populate related collections.

More information: [Mongoose Official Documentation](https://mongoosejs.com/).

---

## Installation

To install Mongoose:

```bash
npm install mongoose
```

---

## Connecting to MongoDB

Example connection:

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

## Schema Definition

Defining a schema:

```javascript
const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  age: Number,
  createdAt: { type: Date, default: Date.now },
});

const User = mongoose.model('User', userSchema);
```

---

## CRUD Operations

### Create

```javascript
const newUser = new User({
  name: 'John',
  email: 'john@example.com',
  age: 30,
});

newUser.save()
  .then(user => console.log('User saved:', user))
  .catch(err => console.error('Save error:', err));
```

### Read

```javascript
User.find()
  .then(users => console.log('Users:', users))
  .catch(err => console.error('Query error:', err));
```

### Update

```javascript
User.findByIdAndUpdate('user_id', { age: 35 }, { new: true })
  .then(user => console.log('Updated user:', user))
  .catch(err => console.error('Update error:', err));
```

### Delete

```javascript
User.findByIdAndDelete('user_id')
  .then(() => console.log('User deleted'))
  .catch(err => console.error('Delete error:', err));
```

---

## Validations and Middleware

### Custom Validation

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

### Middleware

```javascript
userSchema.pre('save', function(next) {
  console.log('Pre-save middleware triggered');
  next();
});

userSchema.post('save', function(doc, next) {
  console.log('Post-save middleware triggered');
  next();
});
```

---

## Data Population

Referencing and populating related data:

```javascript
const postSchema = new mongoose.Schema({
  title: String,
  author: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
});

const Post = mongoose.model('Post', postSchema);

Post.find().populate('author').exec()
  .then(posts => console.log('Posts:', posts))
  .catch(err => console.error('Population error:', err));
```

---

## Deprecated Features

Refer to deprecated features in the [official Mongoose documentation](https://mongoosejs.com/docs/).

---

## Additional References

- [Mongoose Official Documentation](https://mongoosejs.com/docs/)
- [Mongoose Validations](https://mongoosejs.com/docs/validation.html)
