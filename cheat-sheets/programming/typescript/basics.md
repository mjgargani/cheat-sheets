# TypeScript Cheat Sheet

TypeScript is a superset of JavaScript that introduces optional static typing, enhancing scalability and maintainability in software development. This cheat sheet provides a concise overview of its features, including essential concepts and best practices.

## Table of Contents

1. [What is TypeScript?](#what-is-typescript)
2. [Installation and Setup](#installation-and-setup)
3. [Basic Types](#basic-types)
4. [Interfaces and Types](#interfaces-and-types)
5. [Classes and Inheritance](#classes-and-inheritance)
6. [Functions](#functions)
7. [Generics](#generics)
8. [Modules and Namespaces](#modules-and-namespaces)
9. [Deprecated Features](#deprecated-features)
10. [Additional References](#additional-references)

---

## What is TypeScript?

TypeScript is a superset of JavaScript that adds optional static typing and advanced features for scalable development. It helps developers catch errors at compile time and provides enhanced tooling support.

- **Static Typing**: Define types for variables, functions, and returns.
- **Advanced Tooling**: Features like IntelliSense, refactoring, and error checking.
- **Compiles to JavaScript**: TypeScript code is transpiled into JavaScript for browser compatibility.

More information: [TypeScript Official Documentation](https://www.typescriptlang.org/).

---

## Installation and Setup

**Install via npm**:

```bash
npm install -g typescript
```

**Create a configuration file (`tsconfig.json`)**:

```bash
tsc --init
```

---

## Basic Types

```typescript
let isDone: boolean = false;
let decimal: number = 10;
let name: string = 'TypeScript';
let list: number[] = [1, 2, 3];
let tuple: [string, number] = ['TypeScript', 10];
```

---

## Interfaces and Types

```typescript
interface User {
  name: string;
  age: number;
  isAdmin?: boolean;
}

function greet(user: User): string {
  return `Hello, ${user.name}`;
}
```

---

## Classes and Inheritance

```typescript
class Person {
  constructor(public name: string) {}

  greet(): string {
    return `Hello, ${this.name}`;
  }
}

class Employee extends Person {
  constructor(name: string, public position: string) {
    super(name);
  }

  work(): string {
    return `${this.name} is working as a ${this.position}`;
  }
}
```

---

## Functions

```typescript
function add(x: number, y: number): number {
  return x + y;
}

const multiply = (x: number, y: number): number => x * y;
```

---

## Generics

```typescript
function identity<T>(arg: T): T {
  return arg;
}

let output = identity<string>('TypeScript');
```

---

## Modules and Namespaces

### Modules

```typescript
// math.ts
export function add(x: number, y: number): number {
  return x + y;
}

// main.ts
import { add } from './math';
console.log(add(2, 3));
```

### Namespaces

```typescript
namespace Utility {
  export function log(message: string): void {
    console.log(message);
  }
}

Utility.log('Hello, TypeScript!');
```

---

## Deprecated Features

Refer to deprecated features in the [official TypeScript documentation](https://www.typescriptlang.org/docs/).

---

## Additional References

- [TypeScript Official Documentation](https://www.typescriptlang.org/)
- [Configuration Guide](https://www.typescriptlang.org/tsconfig)
