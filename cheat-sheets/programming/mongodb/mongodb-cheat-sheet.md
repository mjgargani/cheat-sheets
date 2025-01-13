# MongoDB Cheat Sheet (Atualizado em Janeiro de 2025)

Este cheat sheet atualizado cobre os comandos essenciais, melhores práticas e recursos para MongoDB, com foco em administração, desenvolvimento e manutenção. As informações são baseadas nas últimas versões do MongoDB e seguem as recomendações oficiais.

## Índice (pt-BR)

1. [O que é o MongoDB?](#o-que-e-o-mongodb)
2. [Instalação](#instalacao)
3. [Comandos de Banco de Dados](#comandos-de-banco-de-dados)
4. [Comandos de Coleções](#comandos-de-colecoes)
5. [Operações com Documentos](#operacoes-com-documentos)
6. [Operadores de Consulta](#operadores-de-consulta)
7. [Framework de Agregação](#framework-de-agregacao)
8. [Indexação](#indexacao)
9. [Recursos Depreciados](#recursos-depreciados)
10. [Referências Adicionais](#referencias-adicionais)

## Table of Contents (en-US)

1. [What is MongoDB?](#what-is-mongodb)
2. [Installation](#installation)
3. [Database Commands](#database-commands)
4. [Collection Commands](#collection-commands)
5. [Document Operations](#document-operations)
6. [Query Operators](#query-operators)
7. [Aggregation Framework](#aggregation-framework)
8. [Indexing](#indexing)
9. [Deprecated Features](#deprecated-features)
10. [Additional References](#additional-references)

---

### O que é o MongoDB? (pt-BR)

MongoDB é um banco de dados NoSQL orientado a documentos, projetado para lidar com grandes volumes de dados não estruturados e semi-estruturados. Ele armazena dados no formato JSON (ou BSON) e é altamente escalável, suportando consultas complexas e índices avançados.

- **Flexível**: Modelos de dados dinâmicos sem esquemas rígidos.
- **Escalável**: Suporte a particionamento e replicação.
- **Consultas Ricas**: Suporte a operadores complexos.

Mais informações: [MongoDB Official Docs](https://www.mongodb.com/docs/).

### What is MongoDB? (en-US)

MongoDB is a NoSQL document-oriented database designed to handle large volumes of unstructured and semi-structured data. It stores data in JSON (or BSON) format and is highly scalable, supporting complex queries and advanced indexing.

- **Flexible**: Dynamic data models without rigid schemas.
- **Scalable**: Supports sharding and replication.
- **Rich Queries**: Comprehensive operator support.

More information: [MongoDB Official Docs](https://www.mongodb.com/docs/).

---

### Instalação (pt-BR)

Para instalar o MongoDB:

```bash
# No Ubuntu
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org

# Inicie o serviço
sudo systemctl start mongod
```

### Installation (en-US)

To install MongoDB:

```bash
# On Ubuntu
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org

# Start the service
sudo systemctl start mongod
```

---

### Comandos de Banco de Dados (pt-BR)

- **Exibir Bancos de Dados**:

```javascript
show dbs;
```

- **Selecionar ou Criar Banco de Dados**:

```javascript
use <nome_do_banco>;
```

- **Excluir Banco de Dados**:

```javascript
db.dropDatabase();
```

### Database Commands (en-US)

- **Show Databases**:

```javascript
show dbs;
```

- **Select or Create a Database**:

```javascript
use <database_name>;
```

- **Drop a Database**:

```javascript
db.dropDatabase();
```

---

### Comandos de Coleções (pt-BR)

- **Exibir Coleções**:

```javascript
show collections;
```

- **Criar uma Coleção**:

```javascript
db.createCollection("nome_da_colecao");
```

- **Excluir uma Coleção**:

```javascript
db.nome_da_colecao.drop();
```

### Collection Commands (en-US)

- **Show Collections**:

```javascript
show collections;
```

- **Create a Collection**:

```javascript
db.createCollection("collection_name");
```

- **Drop a Collection**:

```javascript
db.collection_name.drop();
```

---

### Operações com Documentos (pt-BR)

- **Inserir um Documento**:

```javascript
db.collection_name.insertOne({ key: "value" });
```

- **Encontrar um Documento**:

```javascript
db.collection_name.find({ key: "value" });
```

### Document Operations (en-US)

- **Insert a Document**:

```javascript
db.collection_name.insertOne({ key: "value" });
```

- **Find a Document**:

```javascript
db.collection_name.find({ key: "value" });
```

---

### Operadores de Consulta (pt-BR)

- **Comparação**:

```javascript
$eq, $ne, $gt, $lt, $gte, $lte
```

### Query Operators (en-US)

- **Comparison**:

```javascript
$eq, $ne, $gt, $lt, $gte, $lte
```

---

### Framework de Agregação (pt-BR)

Exemplo:

```javascript
db.collection_name.aggregate([
  { $match: { status: "A" } },
  { $group: { _id: "$cust_id", total: { $sum: "$amount" } } }
]);
```

### Aggregation Framework (en-US)

Example:

```javascript
db.collection_name.aggregate([
  { $match: { status: "A" } },
  { $group: { _id: "$cust_id", total: { $sum: "$amount" } } }
]);
```

---

### Indexação (pt-BR)

- **Criar um Índice**:

```javascript
db.collection_name.createIndex({ key: 1 });
```

### Indexing (en-US)

- **Create an Index**:

```javascript
db.collection_name.createIndex({ key: 1 });
```

---

### Recursos Depreciados (pt-BR)

Consulte os recursos obsoletos na [documentação oficial do MongoDB](https://www.mongodb.com/docs/).

### Deprecated Features (en-US)

Refer to deprecated features in the [official MongoDB documentation](https://www.mongodb.com/docs/).

---

### Referências Adicionais (pt-BR)

- [Documentação Oficial do MongoDB](https://www.mongodb.com/docs/)
- [Guia de Agregação](https://www.mongodb.com/docs/manual/aggregation/)

### Additional References (en-US)

- [MongoDB Official Documentation](https://www.mongodb.com/docs/)
- [Aggregation Guide](https://www.mongodb.com/docs/manual/aggregation/)
