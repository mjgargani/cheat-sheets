# Vanilla JavaScript Cheat Sheet

Vanilla JavaScript refers to using plain JavaScript without additional libraries or frameworks. It is fundamental for web development, enabling developers to create interactive, dynamic, and scalable web applications.

## Table of Contents

1. [Introduction](#introduction)
2. [Basic Concepts](#basic-concepts)
   - [Variable Declarations](#variable-declarations)
   - [Data Types](#data-types)
   - [Conditional Structures](#conditional-structures)
3. [Intermediate Concepts](#intermediate-concepts)
   - [Functions](#functions)
   - [Array Manipulation](#array-manipulation)
   - [Object Manipulation](#object-manipulation)
4. [Advanced Concepts](#advanced-concepts)
   - [Promises and Async/Await](#promises-and-asyncawait)
   - [DOM Manipulation](#dom-manipulation)
   - [Object-Oriented Programming](#object-oriented-programming)
5. [Tips and Best Practices](#tips-and-best-practices)
6. [References](#references)

---

## 1. Introduction

JavaScript is a versatile programming language essential for web development. This cheat sheet covers core and advanced concepts using plain JavaScript (Vanilla JavaScript).

---

## 2. Basic Concepts

### Variable Declarations

- **`var`**: Function-scoped (avoid using).
- **`let`**: Block-scoped.
- **`const`**: Block-scoped, for immutable values.

Example:
```javascript
let name = "John";
const age = 25;
var country = "USA";
```

### Data Types

1. Primitive:
   - `string`, `number`, `boolean`, `undefined`, `null`, `symbol`, `bigint`.
2. Reference:
   - `Object`, `Array`, `Function`.

Example:
```javascript
const text = "Hello";
const number = 42;
const array = [1, 2, 3];
const object = { key: "value" };
```

### Conditional Structures

- **`if`/`else`**:
```javascript
if (age >= 18) {
    console.log("Adult");
} else {
    console.log("Minor");
}
```

- **Ternary Operator**:
```javascript
const message = age >= 18 ? "Adult" : "Minor";
console.log(message);
```

---

## 3. Intermediate Concepts

### Functions

1. Traditional declaration:
```javascript
function add(a, b) {
    return a + b;
}
```

2. Anonymous functions:
```javascript
const subtract = function(a, b) {
    return a - b;
};
```

3. Arrow Functions:
```javascript
const multiply = (a, b) => a * b;
```

### Array Manipulation

1. Common methods:
   - `push`, `pop`, `shift`, `unshift`, `map`, `filter`, `reduce`.

Example:
```javascript
const numbers = [1, 2, 3, 4];
const doubled = numbers.map(n => n * 2);
console.log(doubled); // [2, 4, 6, 8]
```

### Object Manipulation

1. Accessing properties:
```javascript
const person = { name: "Anna", age: 30 };
console.log(person.name); // Anna
```

2. Destructuring:
```javascript
const { name, age } = person;
console.log(name, age);
```

---

## 4. Advanced Concepts

### Promises and Async/Await

1. Promises:
```javascript
const promise = new Promise((resolve, reject) => {
    const success = true;
    if (success) resolve("Success");
    else reject("Failure");
});
```

2. Async/Await:
```javascript
async function execute() {
    try {
        const result = await promise;
        console.log(result);
    } catch (error) {
        console.log(error);
    }
}
```

### DOM Manipulation

1. Selecting elements:
```javascript
const element = document.querySelector("#id");
element.textContent = "New text";
```

2. Adding events:
```javascript
element.addEventListener("click", () => {
    alert("Element clicked!");
});
```

### Object-Oriented Programming

1. Classes:
```javascript
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    greet() {
        return `Hello, my name is ${this.name}`;
    }
}

const john = new Person("John", 25);
console.log(john.greet());
```

---

## 5. Tips and Best Practices

- Always use `const` and `let` instead of `var`.
- Use arrow functions to simplify anonymous functions.
- Prefer destructuring for better readability.
- Validate inputs and handle exceptions.

---

## 6. References

- MDN Web Docs. [JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide).
- Eloquent JavaScript. [Eloquent JavaScript Online Book](https://eloquentjavascript.net/).
- W3Schools. [JavaScript Tutorial](https://www.w3schools.com/js/).
