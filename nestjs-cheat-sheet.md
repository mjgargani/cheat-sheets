Here's an updated Node.js cheat sheet for 2024, formatted in Markdown. This guide covers essential commands, modules, and highlights deprecated features to help you stay current.

````markdown
# Node.js Cheat Sheet (2024)

## Table of Contents

-   [Basics](#basics)
-   [Modules](#modules)
-   [File System](#file-system)
-   [HTTP](#http)
-   [Events](#events)
-   [Streams](#streams)
-   [Child Processes](#child-processes)
-   [Debugging](#debugging)
-   [Deprecated Features](#deprecated-features)

## Basics

-   **Check Node.js Version:**
    ```bash
    node --version
    ```
````

-   **Run a JavaScript File:**

    ```bash
    node filename.js
    ```

-   **REPL (Read-Eval-Print Loop):**

    ```bash
    node
    ```

-   **Global Objects:**
    -   `__dirname`: Directory name of the current module.
    -   `__filename`: File name of the current module.
    -   `process`: Provides information about the current Node.js process.

## Modules

-   **Importing Modules:**

    ```javascript
    const moduleName = require("module-name");
    ```

-   **Exporting Modules:**

    ```javascript
    module.exports = {
        /* exports */
    };
    ```

-   **Built-in Modules:**
    -   `fs`: File system
    -   `http`: HTTP server and client
    -   `path`: File and directory paths
    -   `os`: Operating system information

## File System

-   **Read a File Asynchronously:**

    ```javascript
    const fs = require("fs");
    fs.readFile("/path/to/file", "utf8", (err, data) => {
        if (err) throw err;
        console.log(data);
    });
    ```

-   **Write to a File Asynchronously:**
    ```javascript
    fs.writeFile("/path/to/file", "Hello, world!", (err) => {
        if (err) throw err;
        console.log("File has been written!");
    });
    ```

## HTTP

-   **Create an HTTP Server:**
    ```javascript
    const http = require("http");
    const server = http.createServer((req, res) => {
        res.statusCode = 200;
        res.setHeader("Content-Type", "text/plain");
        res.end("Hello World\n");
    });
    server.listen(3000, () => {
        console.log("Server running at http://localhost:3000/");
    });
    ```

## Events

-   **Using EventEmitter:**

    ```javascript
    const EventEmitter = require("events");
    const emitter = new EventEmitter();

    // Set an event listener
    emitter.on("event", (arg) => {
        console.log("An event occurred:", arg);
    });

    // Emit an event
    emitter.emit("event", { data: "sample data" });
    ```

## Streams

-   **Create a Readable Stream:**

    ```javascript
    const fs = require("fs");
    const readStream = fs.createReadStream("/path/to/file", "utf8");

    readStream.on("data", (chunk) => {
        console.log("New chunk received:", chunk);
    });
    ```

-   **Create a Writable Stream:**

    ```javascript
    const writeStream = fs.createWriteStream("/path/to/file");

    writeStream.write("Hello, world!");
    writeStream.end();
    ```

## Child Processes

-   **Execute a Command:**
    ```javascript
    const { exec } = require("child_process");
    exec("ls -la", (err, stdout, stderr) => {
        if (err) {
            console.error(`exec error: ${err}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
    });
    ```

## Debugging

-   **Basic Debugging:**

    ```javascript
    console.log("Debug message");
    console.error("Error message");
    ```

-   **Start Debugger:**
    ```bash
    node inspect filename.js
    ```

## Deprecated Features

As of 2024, certain Node.js features have been deprecated or removed. It's crucial to avoid using these in new projects and refactor existing codebases accordingly.

-   **Deprecated APIs:**

    -   `OutgoingMessage.prototype.flush()`: Removed. Use `OutgoingMessage.prototype.flushHeaders()` instead.
    -   `Buffer()` constructor: Deprecated due to security concerns. Use `Buffer.alloc()`, `Buffer.allocUnsafe()`, or `Buffer.from()` instead.

-   **Deprecated Node.js Versions:**

    -   **Node.js 14**: Reached end-of-life on April 30, 2023.
    -   **Node.js 16**: Reached end-of-life on September 11, 2023.

    Ensure your projects are running on supported Node.js versions to receive security updates and maintain compatibility.

## References

-   [Node.js Official Documentation](https://nodejs.org/en/docs/)
-   [Node.js Deprecated APIs](https://nodejs.org/api/deprecations.html)
-   [Node.js End-of-Life Schedule](https://endoflife.date/nodejs)

```

**Note:** Regularly consult the [official Node.js documentation](https://nodejs.org/en/docs/) for the most up-to-date information, as the platform continues to evolve.
```
