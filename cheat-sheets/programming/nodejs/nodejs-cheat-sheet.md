# Node.js Cheat Sheet

Node.js is a JavaScript runtime built on Chrome's V8 engine, enabling the execution of JavaScript code outside the browser. It is widely used for creating scalable, high-performance server-side applications.

---

## Table of Contents

1. [What is Node.js?](#what-is-nodejs)
2. [Installation](#installation)
3. [Running Scripts](#running-scripts)
4. [Modules](#modules)
5. [Events](#events)
6. [File System](#file-system)
7. [HTTP](#http)
8. [Debugging](#debugging)
9. [Deprecated Features](#deprecated-features)
10. [Additional References](#additional-references)

---

## What is Node.js?

Node.js is designed for server-side and networking applications. Its non-blocking, event-driven architecture makes it ideal for data-intensive real-time applications.

- **Event-Driven**: Handles asynchronous operations efficiently.
- **High Performance**: Powered by the V8 JavaScript engine.
- **Rich Ecosystem**: Millions of packages available on npm.

More information: [Node.js Official Documentation](https://nodejs.org/).

---

## Installation

Download and install Node.js from the official website:

```bash
# For Debian/Ubuntu-based systems
sudo apt update
sudo apt install -y nodejs npm

# Verify the installed version
node --version
npm --version
```

---

## Running Scripts

- **Run a JavaScript file**:

```bash
node file.js
```

- **Open the REPL (Read-Eval-Print Loop)**:

```bash
node
```

---

## Modules

### Importing a Module

```javascript
const fs = require('fs');
```

### Exporting Functions or Objects

```javascript
module.exports = {
  myFunction: () => console.log('Hello!'),
};
```

---

## Events

### Creating and Emitting Events

```javascript
const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('event', () => console.log('Event fired!'));
emitter.emit('event');
```

---

## File System

### Reading a File

```javascript
const fs = require('fs');
fs.readFile('file.txt', 'utf8', (err, data) => {
  if (err) throw err;
  console.log(data);
});
```

---

## HTTP

### Creating an HTTP Server

```javascript
const http = require('http');
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, World!\n');
});

server.listen(3000, () => {
  console.log('Server running at http://localhost:3000/');
});
```

---

## Debugging

### Starting the Debugger

```bash
node inspect file.js
```

---

## Deprecated Features

Refer to deprecated features in the [official Node.js documentation](https://nodejs.org/api/deprecations.html).

---

## Additional References

- [Node.js Official Documentation](https://nodejs.org/)
- [npm - Package Manager](https://www.npmjs.com/)
