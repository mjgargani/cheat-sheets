# MongoDB Cheat Sheet

MongoDB is a NoSQL document-oriented database designed to handle large volumes of unstructured and semi-structured data. This cheat sheet covers essential commands, best practices, and advanced features for administration, development, and maintenance.

---

## Table of Contents

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

## What is MongoDB?

MongoDB is designed to store data in JSON-like documents, providing flexibility and scalability for modern applications.

- **Flexible**: Dynamic schemas for evolving data models.
- **Scalable**: Supports sharding and replication for distributed systems.
- **Rich Queries**: Offers comprehensive query capabilities, including aggregation pipelines.

More information: [MongoDB Official Documentation](https://www.mongodb.com/docs/).

---

## Installation

To install MongoDB on Ubuntu:

```bash
# Import the public key and add the repository
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update and install MongoDB
sudo apt update
sudo apt install -y mongodb-org

# Start the MongoDB service
sudo systemctl start mongod
```

---

## Database Commands

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

## Collection Commands

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

## Document Operations

- **Insert a Document**:

```javascript
db.collection_name.insertOne({ key: "value" });
```

- **Find a Document**:

```javascript
db.collection_name.find({ key: "value" });
```

---

## Query Operators

- **Comparison Operators**:

```javascript
$eq, $ne, $gt, $lt, $gte, $lte
```

---

## Aggregation Framework

Example of an aggregation pipeline:

```javascript
db.collection_name.aggregate([
  { $match: { status: "A" } },
  { $group: { _id: "$cust_id", total: { $sum: "$amount" } } }
]);
```

---

## Indexing

- **Create an Index**:

```javascript
db.collection_name.createIndex({ key: 1 });
```

---

## Deprecated Features

Refer to deprecated features in the [official MongoDB documentation](https://www.mongodb.com/docs/).

---

## Additional References

- [MongoDB Official Documentation](https://www.mongodb.com/docs/)
- [Aggregation Guide](https://www.mongodb.com/docs/manual/aggregation/)
