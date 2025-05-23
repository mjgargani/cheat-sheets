I am marking this repository as **DEPRECIATED** because, in addition to lacking more refined curation, it will be part of a new repository that I call open-docs.

The methods I used to prepare this material using the machine do not match my perception of its current popular use.

# Development Cheat Sheets Repository

This repository contains a collection of cheat sheets for various development tools and technologies. Each file provides essential commands, configuration examples, and best practices to help developers work efficiently.

**Note:** These cheat sheets were created and updated with the assistance of ChatGPT.

---

## Table of Contents

### AI-Usage
- [Responsibility Terms](./ai-usage/responsability.md)

### Cheat Sheets

#### Networking
- [Advanced Concepts](./cheat-sheets/networking/advanced/concepts.md)

#### Programming
- **JavaScript**
  - [Vanilla JavaScript](./cheat-sheets/programming/javascript/vanilla.md)
- **MongoDB**
  - [MongoDB Cheat Sheet](./cheat-sheets/programming/mongodb/mongodb.md)
  - [Mongoose Cheat Sheet](./cheat-sheets/programming/mongodb/mongoose.md)
- **NestJS**
  - [DTOs and Relations](./cheat-sheets/programming/nestjs/dtos-relations.md)
  - [Jest with TypeScript and NestJS](./cheat-sheets/programming/nestjs/jest-ts-nestjs.md)
  - [NestJS Cheat Sheet](./cheat-sheets/programming/nestjs/nestjs.md)
  - [Class Validator in NestJS](./cheat-sheets/programming/nestjs/nestjs-class-validator.md)
  - [Generic DTO in NestJS](./cheat-sheets/programming/nestjs/nestjs-dto-generic.md)
  - [DTO with ORM/ODM in NestJS](./cheat-sheets/programming/nestjs/nestjs-dto-orm-odm.md)
  - [NestJS DTOs](./cheat-sheets/programming/nestjs/nestjs-dtos.md)
  - [Security in NestJS](./cheat-sheets/programming/nestjs/nestjs-security.md)
- **Node.js**
  - [Node.js Cheat Sheet](./cheat-sheets/programming/nodejs/basics.md)
  - [Vite with React and TypeScript](./cheat-sheets/programming/nodejs/vite-reactjs-ts.md)
  - [Vite with Vitest](./cheat-sheets/programming/nodejs/vite-vitest.md)
- **Shell**
  - [Shell Scripting](./cheat-sheets/programming/shell/scripting.md)
- **Powershell**
  - [Powershell Scripting](./cheat-sheets/programming/power-shell/guide.md)
- **TypeScript**
  - [Decorators in NestJS](./cheat-sheets/programming/typescript/decorators-nestjs.md)
  - [TypeScript Cheat Sheet](./cheat-sheets/programming/typescript/basics.md)
- **Comparisons**
  - [PS x BASH x SH](./cheat-sheets/programming/comparisons/ps-bash-shell-script.md)
  - [Why PS on Linux?](./cheat-sheets/programming/comparisons/ps-on-linux.md)

#### Servers
- **Files**
  - [Linux File Server](./cheat-sheets/servers/files/linux.md)
  - [Windows File Server](./cheat-sheets/servers/files/windows.md)
- **Web**
  - [Node.js Basics](./cheat-sheets/servers/web/basics-nodejs.md)

#### Systems
- **Docker**
  - [Docker Cheat Sheet](./cheat-sheets/systems/docker/basics.md)
- **Linux**
  - [Linux Folder Structure](./cheat-sheets/systems/linux/folder-structure.md)
  - [Proxmox Virtual Environment](./cheat-sheets/systems/linux/pve.md)
  - [OPNsense](./cheat-sheets/systems/linux/opn-sense.md)

#### Tools
- **VSCode**
  - [VSCode Cheat Sheet](./cheat-sheets/tools/vscode/vscode.md)
  - [VSCode Server Cheat Sheet](./cheat-sheets/tools/vscode/vscode-server.md)

---

## Script for Compression

To facilitate project compression and submission for review or analysis, a `compress_project.sh` script is included. This script:

- Compresses the current repository into a high-compression ZIP file.
- Names the file using the format `md_cheat-sheets_<timestamp>.zip`.
- Automates the generation of dated backups.

### Usage Instructions

1. Ensure the script is located in the repository root.
2. Make the script executable:
   ```bash
   chmod +x compress_project.sh
   ```
3. Run the script:
   ```bash
   ./compress_project.sh
   ```
   This will create a ZIP file in the repository root, timestamped in its name.

---

## Usage

Each cheat sheet is organized to provide a quick and easy reference for common commands and configurations. Open the relevant file for the technology or tool you're working with.

---

## Contributions

Contributions are welcome! If you’d like to add new cheat sheets or improve existing ones, feel free to open a pull request.
