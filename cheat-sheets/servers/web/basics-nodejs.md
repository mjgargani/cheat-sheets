# Web Servers - Basics with Node.js

Web servers are fundamental components of modern applications, enabling the delivery of content (HTML, CSS, JavaScript, etc.) and communication with clients over HTTP/HTTPS. This cheat sheet introduces key concepts of web servers with practical examples using Node.js.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Web Server Basics](#web-server-basics)
   - [What is a Web Server?](#what-is-a-web-server)
   - [How Does It Work?](#how-does-it-work)
3. [Practical Example with Node.js](#practical-example-with-nodejs)
   - [Setting Up the Environment](#setting-up-the-environment)
   - [Creating a Basic Server](#creating-a-basic-server)
   - [Serving Static Files](#serving-static-files)
4. [Related Concepts](#related-concepts)
   - [CORS](#cors)
   - [HTTP Status Codes](#http-status-codes)
5. [References](#references)

---

## 1. Introduction

Web servers process client requests and deliver content or responses, such as HTML pages, JSON data, or static files. Node.js, with its lightweight and non-blocking architecture, is a popular choice for building web servers.

---

## 2. Web Server Basics

### What is a Web Server?

A web server is a software or hardware system that:
- Receives HTTP/HTTPS requests from clients (e.g., browsers, scripts).
- Processes the requests and returns responses (e.g., HTML pages, JSON data).

### How Does It Work?

1. The client sends a request to a specific address (e.g., `http://localhost:3000`).
2. The server processes the request by:
   - Serving a static file (e.g., HTML, CSS).
   - Generating a dynamic response (e.g., JSON).
3. The server responds with the requested data and an HTTP status code.

---

## 3. Practical Example with Node.js

### Setting Up the Environment

1. **Install Node.js**:
   - Download the installer from [Node.js Official Website](https://nodejs.org).
   - Verify the installation:
     ```bash
     node -v
     npm -v
     ```

2. **Create a Project Directory**:
   ```bash
   mkdir basic-web-server
   cd basic-web-server
   npm init -y
   ```

### Creating a Basic Server

1. **Create a `server.js` File**:
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

2. **Run the Server**:
   ```bash
   node server.js
   ```

3. **Access the Server**:
   - Open a browser and go to `http://127.0.0.1:3000`.

### Serving Static Files

1. **Create a `public` Directory with an `index.html` File**:
   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>My Server</title>
   </head>
   <body>
       <h1>Welcome to My Server!</h1>
   </body>
   </html>
   ```

2. **Update `server.js` to Serve Static Files**:
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

3. **Restart the Server and Test Again**.

---

## 4. Related Concepts

### CORS (Cross-Origin Resource Sharing)

- Enables servers to specify who can access their resources.
- Example header in Node.js:
  ```javascript
  res.setHeader('Access-Control-Allow-Origin', '*');
  ```

### HTTP Status Codes

- **200**: OK (Request successful).
- **404**: Not Found (Resource not found).
- **500**: Internal Server Error (Server-side issue).

---

## 5. References

- Node.js Docs. [HTTP Module](https://nodejs.org/api/http.html)
- Mozilla. [HTTP Overview](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
- W3Schools. [Node.js Tutorial](https://www.w3schools.com/nodejs/)
