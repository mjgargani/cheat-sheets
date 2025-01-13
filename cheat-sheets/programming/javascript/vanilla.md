# JavaScript Vanilla - Guia Completo

## Sumário

1. [Introdução](#introducao)
2. [Conceitos Básicos](#conceitos-basicos)
   - [Declaração de Variáveis](#declaracao-de-variaveis)
   - [Tipos de Dados](#tipos-de-dados)
   - [Estruturas Condicionais](#estruturas-condicionais)
3. [Conceitos Intermediários](#conceitos-intermediarios)
   - [Funções](#funcoes)
   - [Manipulação de Arrays](#manipulacao-de-arrays)
   - [Manipulação de Objetos](#manipulacao-de-objetos)
4. [Conceitos Avançados](#conceitos-avancados)
   - [Promises e Async/Await](#promises-e-async-await)
   - [Manipulação de DOM](#manipulacao-de-dom)
   - [Programação Orientada a Objetos](#programacao-orientada-a-objetos)
5. [Dicas e Boas Práticas](#dicas-e-boas-praticas)
6. [Referências](#referencias)

---

## 1. Introdução

JavaScript é uma linguagem de programação essencial para desenvolvimento web. Este guia cobre conceitos fundamentais e avançados, usando apenas JavaScript puro (Vanilla JavaScript).

---

## 2. Conceitos Básicos

### Declaração de Variáveis

- **`var`**: Escopo de função (evitar uso).
- **`let`**: Escopo de bloco.
- **`const`**: Escopo de bloco, para valores imutáveis.

Exemplo:
```javascript
let nome = "João";
const idade = 25;
var pais = "Brasil";
```

### Tipos de Dados

1. Primitivos:
   - `string`, `number`, `boolean`, `undefined`, `null`, `symbol`, `bigint`.
2. Referência:
   - `Object`, `Array`, `Function`.

Exemplo:
```javascript
const texto = "Olá";
const numero = 42;
const lista = [1, 2, 3];
const objeto = { chave: "valor" };
```

### Estruturas Condicionais

- **`if`/`else`**:
```javascript
if (idade >= 18) {
    console.log("Maior de idade");
} else {
    console.log("Menor de idade");
}
```

- **Operador Ternário**:
```javascript
const mensagem = idade >= 18 ? "Maior de idade" : "Menor de idade";
console.log(mensagem);
```

---

## 3. Conceitos Intermediários

### Funções

1. Declaração tradicional:
```javascript
function somar(a, b) {
    return a + b;
}
```

2. Funções anônimas:
```javascript
const subtrair = function(a, b) {
    return a - b;
};
```

3. Arrow Functions:
```javascript
const multiplicar = (a, b) => a * b;
```

### Manipulação de Arrays

1. Métodos comuns:
   - `push`, `pop`, `shift`, `unshift`, `map`, `filter`, `reduce`.

Exemplo:
```javascript
const numeros = [1, 2, 3, 4];
const dobrados = numeros.map(n => n * 2);
console.log(dobrados); // [2, 4, 6, 8]
```

### Manipulação de Objetos

1. Acessando propriedades:
```javascript
const pessoa = { nome: "Ana", idade: 30 };
console.log(pessoa.nome); // Ana
```

2. Desestruturação:
```javascript
const { nome, idade } = pessoa;
console.log(nome, idade);
```

---

## 4. Conceitos Avançados

### Promises e Async/Await

1. Promises:
```javascript
const promessa = new Promise((resolve, reject) => {
    const sucesso = true;
    if (sucesso) resolve("Deu certo");
    else reject("Deu errado");
});
```

2. Async/Await:
```javascript
async function executar() {
    try {
        const resultado = await promessa;
        console.log(resultado);
    } catch (erro) {
        console.log(erro);
    }
}
```

### Manipulação de DOM

1. Selecionar elementos:
```javascript
const elemento = document.querySelector("#id");
elemento.textContent = "Novo texto";
```

2. Adicionar eventos:
```javascript
elemento.addEventListener("click", () => {
    alert("Elemento clicado!");
});
```

### Programação Orientada a Objetos

1. Classes:
```javascript
class Pessoa {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade;
    }

    cumprimentar() {
        return `Olá, meu nome é ${this.nome}`;
    }
}

const joao = new Pessoa("João", 25);
console.log(joao.cumprimentar());
```

---

## 5. Dicas e Boas Práticas

- Sempre use `const` e `let` ao invés de `var`.
- Utilize arrow functions para simplificar funções anônimas.
- Prefira desestruturação para melhorar a legibilidade do código.
- Valide entradas e trate exceções.

---

## 6. Referências

- MDN Web Docs. [JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide). Acesso em 12/01/2025.
- Eloquent JavaScript. [Eloquent JavaScript Online Book](https://eloquentjavascript.net/). Acesso em 12/01/2025.
- W3Schools. [JavaScript Tutorial](https://www.w3schools.com/js/). Acesso em 12/01/2025.
