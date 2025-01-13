# Servidores Web - Princípios Básicos e Node.js

## Sumário

1. [Introdução](#introducao)
2. [Princípios Básicos de Servidores Web](#principios-basicos-de-servidores-web)
   - [O que é um Servidor Web?](#o-que-e-um-servidor-web)
   - [Como Funciona?](#como-funciona)
3. [Exemplo Prático com Node.js](#exemplo-pratico-com-nodejs)
   - [Configurando o Ambiente](#configurando-o-ambiente)
   - [Criando um Servidor Básico](#criando-um-servidor-basico)
   - [Servindo Arquivos Estáticos](#servindo-arquivos-estaticos)
4. [Conceitos Relacionados](#conceitos-relacionados)
   - [CORS](#cors)
   - [HTTP Status Codes](#http-status-codes)
5. [Referências](#referencias)

---

## 1. Introdução

Servidores web são componentes fundamentais para aplicações modernas. Eles permitem a entrega de conteúdo (HTML, CSS, JavaScript, etc.) e comunicação com clientes via HTTP/HTTPS.

Este guia aborda princípios básicos de servidores web e um exemplo prático usando Node.js, sem frameworks.

---

## 2. Princípios Básicos de Servidores Web

### O que é um Servidor Web?

Um servidor web é um software ou hardware que:
- Recebe requisições HTTP/HTTPS de clientes (navegadores, scripts, etc.).
- Processa a requisição e retorna uma resposta (ex.: uma página HTML ou JSON).

### Como Funciona?

1. O cliente envia uma requisição para um endereço específico (ex.: `http://localhost:3000`).
2. O servidor processa a requisição, podendo:
   - Entregar um arquivo estático (HTML, CSS, imagem, etc.).
   - Executar uma lógica para gerar uma resposta dinâmica (ex.: JSON).
3. O servidor retorna uma resposta com um código de status HTTP.

---

## 3. Exemplo Prático com Node.js

### Configurando o Ambiente

1. **Instale o Node.js**:
   - Faça o download do instalador oficial: [https://nodejs.org](https://nodejs.org).
   - Confirme a instalação:
     ```bash
     node -v
     npm -v
     ```

2. **Crie uma pasta para o projeto**:
   ```bash
   mkdir servidor-web-basico
   cd servidor-web-basico
   npm init -y
   ```

### Criando um Servidor Básico

1. **Crie o arquivo `server.js`**:
   ```javascript
   const http = require('http');

   const hostname = '127.0.0.1';
   const port = 3000;

   const server = http.createServer((req, res) => {
       res.statusCode = 200;
       res.setHeader('Content-Type', 'text/plain');
       res.end('Hello, World!\n');
   });

   server.listen(port, hostname, () => {
       console.log(`Server running at http://${hostname}:${port}/`);
   });
   ```

2. **Execute o servidor**:
   ```bash
   node server.js
   ```

3. **Acesse no navegador**: `http://127.0.0.1:3000`

### Servindo Arquivos Estáticos

1. **Crie uma pasta `public` e adicione um arquivo `index.html`**:
   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>Meu Servidor</title>
   </head>
   <body>
       <h1>Bem-vindo ao meu servidor!</h1>
   </body>
   </html>
   ```

2. **Atualize o `server.js` para servir arquivos estáticos**:
   ```javascript
   const http = require('http');
   const fs = require('fs');
   const path = require('path');

   const hostname = '127.0.0.1';
   const port = 3000;

   const server = http.createServer((req, res) => {
       const filePath = path.join(__dirname, 'public', req.url === '/' ? 'index.html' : req.url);
       const ext = path.extname(filePath);
       const contentType = ext === '.html' ? 'text/html' : 'text/plain';

       fs.readFile(filePath, (err, content) => {
           if (err) {
               res.statusCode = 404;
               res.end('File not found');
           } else {
               res.statusCode = 200;
               res.setHeader('Content-Type', contentType);
               res.end(content);
           }
       });
   });

   server.listen(port, hostname, () => {
       console.log(`Server running at http://${hostname}:${port}/`);
   });
   ```

3. **Reinicie o servidor e teste novamente**.

---

## 4. Conceitos Relacionados

### CORS

- Permite que servidores especifiquem quem pode acessar seus recursos.
- Exemplo de cabeçalho CORS no Node.js:
  ```javascript
  res.setHeader('Access-Control-Allow-Origin', '*');
  ```

### HTTP Status Codes

- **200**: OK (requisição bem-sucedida).
- **404**: Not Found (arquivo ou recurso não encontrado).
- **500**: Internal Server Error (erro no servidor).

---

## 5. Referências

- Node.js Docs. [HTTP Module](https://nodejs.org/api/http.html). Acesso em 12/01/2025.
- Mozilla. [HTTP Overview](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview). Acesso em 12/01/2025.
- W3Schools. [Node.js Tutorial](https://www.w3schools.com/nodejs/). Acesso em 12/01/2025.
