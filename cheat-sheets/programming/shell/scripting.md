# Shell/Bash Scripting Cheat Sheet

Shell scripting is a powerful way to automate tasks on Linux and Unix systems. This guide covers essential and advanced concepts for creating efficient and well-organized scripts.

## Table of Contents

1. [Introduction](#introduction)
2. [Basic Concepts](#basic-concepts)
   - [What is a Shell Script?](#what-is-a-shell-script)
   - [First Script](#first-script)
   - [Running Scripts](#running-scripts)
3. [Intermediate Concepts](#intermediate-concepts)
   - [Variables and Operations](#variables-and-operations)
   - [Conditional Structures](#conditional-structures)
   - [Loops](#loops)
4. [Advanced Concepts](#advanced-concepts)
   - [Functions](#functions)
   - [File Manipulation](#file-manipulation)
   - [Script Debugging](#script-debugging)
5. [Tips and Best Practices](#tips-and-best-practices)
6. [References](#references)

---

## 1. Introduction

Shell scripting is a way to write scripts to automate repetitive tasks or manage system-level operations. It allows developers and system administrators to efficiently execute sequences of commands.

---

## 2. Basic Concepts

### What is a Shell Script?

A shell script is a text file containing a series of commands interpreted by the shell (e.g., `bash`, `zsh`, or `sh`).

### First Script

1. Create a file named `my_script.sh`:
   ```bash
   nano my_script.sh
   ```

2. Add the following content:
   ```bash
   #!/bin/bash
   echo "Hello, world!"
   ```

3. Make the script executable:
   ```bash
   chmod +x my_script.sh
   ```

4. Run the script:
   ```bash
   ./my_script.sh
   ```

### Running Scripts

- **Direct Execution**:
  ```bash
  ./my_script.sh
  ```
- **Using the Interpreter**:
  ```bash
  bash my_script.sh
  ```

---

## 3. Intermediate Concepts

### Variables and Operations

1. Declaring variables:
   ```bash
   name="John"
   echo "Hello, $name"
   ```

2. Performing arithmetic:
   ```bash
   x=$((5 + 3))
   echo "$x"
   ```

3. Environment variables:
   ```bash
   echo "$HOME"
   echo "$PATH"
   ```

### Conditional Structures

1. Simple `if` statement:
   ```bash
   if [ $x -gt 5 ]; then
       echo "Greater than 5"
   fi
   ```

2. `if-else` statement:
   ```bash
   if [ $x -eq 5 ]; then
       echo "Equal to 5"
   else
       echo "Not equal to 5"
   fi
   ```

3. Common operators:
   - Equal: `-eq`
   - Not equal: `-ne`
   - Greater than: `-gt`
   - Less than: `-lt`

### Loops

1. `for` loop:
   ```bash
   for i in {1..5}; do
       echo "Number $i"
   done
   ```

2. `while` loop:
   ```bash
   count=0
   while [ $count -lt 5 ]; do
       echo "Count: $count"
       count=$((count + 1))
   done
   ```

---

## 4. Advanced Concepts

### Functions

1. Defining functions:
   ```bash
   my_function() {
       echo "This is a function."
   }
   my_function
   ```

2. Passing parameters:
   ```bash
   add() {
       echo $(( $1 + $2 ))
   }
   add 5 3
   ```

### File Manipulation

1. Reading a file line by line:
   ```bash
   while IFS= read -r line; do
       echo "$line"
   done < file.txt
   ```

2. Redirecting output:
   ```bash
   echo "Text" > file.txt
   echo "More text" >> file.txt
   ```

### Script Debugging

1. Running in debug mode:
   ```bash
   bash -x my_script.sh
   ```

2. Adding debug points:
   ```bash
   set -x  # Start debugging
   # Commands
   set +x  # Stop debugging
   ```

---

## 5. Tips and Best Practices

- Always add the **shebang** (`#!/bin/bash`) at the beginning of scripts.
- Use comments to explain complex commands.
- Validate inputs and handle errors with clear messages.
- Use descriptive variable names for readability.
- Test scripts in a safe environment before production.

---

## 6. References

- GNU. [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- Linux Handbook. [Bash Scripting Basics](https://linuxhandbook.com/bash-scripting/)
- Stack Overflow. [Shell Script Best Practices](https://stackoverflow.com/)
