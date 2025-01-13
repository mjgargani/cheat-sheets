# Node.js Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet cobre comandos essenciais, conceitos importantes e práticas recomendadas para o desenvolvimento com Node.js. Baseado nas últimas versões, serve como um guia prático para desenvolvedores.

## Índice (pt-BR)

1. [O que é o Node.js?](#o-que-e-o-nodejs)
2. [Instalação](#instalacao)
3. [Execução de Scripts](#execucao-de-scripts)
4. [Módulos](#modulos)
5. [Eventos](#eventos)
6. [File System](#file-system)
7. [HTTP](#http)
8. [Debugging](#debugging)
9. [Recursos Depreciados](#recursos-depreciados)
10. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

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

### O que é o Node.js? (pt-BR)

Node.js é um runtime JavaScript baseado no mecanismo V8 do Chrome. Ele permite executar código JavaScript fora do navegador e é amplamente utilizado para criar aplicações de servidor escaláveis e performáticas.

- **Event-Driven**: Baseado em eventos e não bloqueante.
- **Alta Performance**: Aproveita o V8 para executar código rapidamente.
- **Ecosistema Rico**: Milhões de pacotes disponíveis no npm.

Mais informações: [Node.js Oficial](https://nodejs.org/pt-br/).

### What is Node.js? (en-US)

Node.js is a JavaScript runtime built on Chrome's V8 engine. It enables running JavaScript code outside the browser and is widely used for creating scalable and high-performance server applications.

- **Event-Driven**: Non-blocking and event-based.
- **High Performance**: Utilizes V8 for fast code execution.
- **Rich Ecosystem**: Millions of packages available on npm.

More information: [Node.js Official](https://nodejs.org/).

---

### Instalação (pt-BR)

Baixe e instale o Node.js do site oficial:

```bash
# Para sistemas baseados em Debian/Ubuntu
sudo apt update
sudo apt install -y nodejs npm

# Verifique a versão instalada
node --version
npm --version
```

### Installation (en-US)

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

### Execução de Scripts (pt-BR)

- **Executar um arquivo JavaScript**:

```bash
node arquivo.js
```

- **Abrir o REPL (Read-Eval-Print Loop)**:

```bash
node
```

### Running Scripts (en-US)

- **Run a JavaScript file**:

```bash
node file.js
```

- **Open the REPL (Read-Eval-Print Loop)**:

```bash
node
```

---

### Módulos (pt-BR)

**Importando um módulo:**

```javascript
const fs = require('fs');
```

**Exportando funções ou objetos:**

```javascript
module.exports = {
  minhaFuncao: () => console.log('Olá!'),
};
```

### Modules (en-US)

**Importing a module:**

```javascript
const fs = require('fs');
```

**Exporting functions or objects:**

```javascript
module.exports = {
  myFunction: () => console.log('Hello!'),
};
```

---

### Eventos (pt-BR)

**Criando e Emitindo Eventos:**

```javascript
const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('evento', () => console.log('Evento disparado!'));
emitter.emit('evento');
```

### Events (en-US)

**Creating and Emitting Events:**

```javascript
const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('event', () => console.log('Event fired!'));
emitter.emit('event');
```

---

### File System (pt-BR)

**Lendo um arquivo:**

```javascript
const fs = require('fs');
fs.readFile('arquivo.txt', 'utf8', (err, data) => {
  if (err) throw err;
  console.log(data);
});
```

### File System (en-US)

**Reading a file:**

```javascript
const fs = require('fs');
fs.readFile('file.txt', 'utf8', (err, data) => {
  if (err) throw err;
  console.log(data);
});
```

---

### HTTP (pt-BR)

**Criando um servidor HTTP:**

```javascript
const http = require('http');
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Olá Mundo\n');
});

server.listen(3000, () => {
  console.log('Servidor rodando em http://localhost:3000/');
});
```

### HTTP (en-US)

**Creating an HTTP server:**

```javascript
const http = require('http');
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
});

server.listen(3000, () => {
  console.log('Server running at http://localhost:3000/');
});
```

---

### Debugging (pt-BR)

**Iniciando o Debugger:**

```bash
node inspect arquivo.js
```

### Debugging (en-US)

**Starting the Debugger:**

```bash
node inspect file.js
```

---

### Recursos Depreciados (pt-BR)

Consulte as funções obsoletas e removidas na [documentação oficial](https://nodejs.org/api/deprecations.html).

### Deprecated Features (en-US)

Refer to deprecated and removed functions in the [official documentation](https://nodejs.org/api/deprecations.html).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do Node.js](https://nodejs.org/pt-br/)
- [npm - Gerenciador de Pacotes](https://www.npmjs.com/)

### Additional References (en-US)

- [Node.js Official Documentation](https://nodejs.org/)
- [npm - Package Manager](https://www.npmjs.com/)
