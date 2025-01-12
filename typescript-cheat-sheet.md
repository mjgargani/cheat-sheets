Here's an updated MongoDB cheat sheet for 2024, formatted in Markdown. This guide includes essential commands and highlights deprecated functions and attributes to help you stay current with MongoDB's latest practices.

```markdown
# MongoDB Cheat Sheet (2024)

## Table of Contents
- [Connecting to MongoDB](#connecting-to-mongodb)
- [Database Commands](#database-commands)
- [Collection Commands](#collection-commands)
- [Document Commands](#document-commands)
- [Query Operators](#query-operators)
- [Update Operators](#update-operators)
- [Aggregation Framework](#aggregation-framework)
- [Indexing](#indexing)
- [User Management](#user-management)
- [Replication Commands](#replication-commands)
- [Sharding Commands](#sharding-commands)
- [Deprecated Functions and Attributes](#deprecated-functions-and-attributes)

## Connecting to MongoDB

```bash
# Connect to the default MongoDB instance
mongo

# Connect to a specific database
mongo myDatabase

# Connect to a remote MongoDB server
mongo --host <hostname> --port <port>
```

## Database Commands

```javascript
// Show all databases
show dbs

// Switch to or create a database
use myDatabase

// Show current database
db

// Drop the current database
db.dropDatabase()
```

## Collection Commands

```javascript
// Show all collections
show collections

// Create a collection
db.createCollection("myCollection")

// Drop a collection
db.myCollection.drop()
```

## Document Commands

```javascript
// Insert a single document
db.myCollection.insertOne({ name: "John Doe", age: 30 })

// Insert multiple documents
db.myCollection.insertMany([
  { name: "Alice", age: 25 },
  { name: "Bob", age: 35 }
])

// Find all documents
db.myCollection.find()

// Find documents with a query
db.myCollection.find({ age: { $gt: 30 } })

// Find one document
db.myCollection.findOne({ name: "Alice" })

// Update a single document
db.myCollection.updateOne(
  { name: "John Doe" },
  { $set: { age: 31 } }
)

// Update multiple documents
db.myCollection.updateMany(
  { age: { $gt: 25 } },
  { $inc: { age: 1 } }
)

// Delete a single document
db.myCollection.deleteOne({ name: "Bob" })

// Delete multiple documents
db.myCollection.deleteMany({ age: { $lt: 30 } })
```

## Query Operators

```javascript
// Comparison Operators
$eq   // Equal to
$ne   // Not equal to
$gt   // Greater than
$gte  // Greater than or equal to
$lt   // Less than
$lte  // Less than or equal to

// Logical Operators
$and  // Logical AND
$or   // Logical OR
$not  // Logical NOT
$nor  // Logical NOR

// Element Operators
$exists  // Checks for existence of a field
$type    // Checks the type of a field

// Evaluation Operators
$regex   // Regular expression match
$text    // Text search
$where   // JavaScript expression
```

## Update Operators

```javascript
$set         // Sets the value of a field
$unset       // Removes a field
$inc         // Increments the value of a field
$mul         // Multiplies the value of a field
$rename      // Renames a field
$min         // Updates if the new value is less than the current value
$max         // Updates if the new value is greater than the current value
$currentDate // Sets the field to the current date
```

## Aggregation Framework

```javascript
db.myCollection.aggregate([
  { $match: { status: "A" } },
  { $group: { _id: "$cust_id", total: { $sum: "$amount" } } },
  { $sort: { total: -1 } }
])
```

## Indexing

```javascript
// Create an index on a field
db.myCollection.createIndex({ name: 1 })

// Create a compound index
db.myCollection.createIndex({ name: 1, age: -1 })

// List all indexes
db.myCollection.getIndexes()

// Drop an index
db.myCollection.dropIndex("indexName")
```

## User Management

```javascript
// Switch to the admin database
use admin

// Create a new user
db.createUser({
  user: "username",
  pwd: "password",
  roles: ["readWrite", "dbAdmin"]
})

// Update a user's password
db.updateUser("username", { pwd: "newPassword" })

// Drop a user
db.dropUser("username")
```

## Replication Commands

```javascript
// Initiate a replica set
rs.initiate()

// Add a member to the replica set
rs.add("hostname:port")

// Remove a member from the replica set
rs.remove("hostname:port")

// Get replica set status
rs.status()
```

## Sharding Commands

```javascript
// Enable sharding for a database
sh.enableSharding("myDatabase")

// Shard a collection
sh.shardCollection("myDatabase.myCollection", { shardKey: 1 })

// Add a shard to the cluster
sh.addShard("hostname:port")

// Remove a shard from the cluster
sh.removeShard("shardName")

// Check sharding status
sh.status()
```

## Deprecated Functions and Attributes

As of 2024, MongoDB has deprecated certain features. It's important to be aware of these changes to maintain compatibility and security.

- **Atlas Data API and HTTPS Endpoints**: Deprecated in September 2024, with end-of-life on September 30, 2025. Users should migrate to alternative solutions. 

- **Device Sync**: Deprecated for Atlas App Services as of September 2024, with removal scheduled for September 30, 2025. Migration to alternative solutions is recommended. 

- **Functions Called from Non-Trigger Sources**: Functions invoked from sources other than Triggers, such as HTTP Endpoints and Device SDKs, are being deprecated. 

- **`strictQuery` Option in Mongoose**: A deprecation warning indicates that the `strictQuery` option will be deprecated in a future release. 

For the most current information on deprecated features, always refer to the [official MongoDB documentation](https://www.mongodb.com/docs/).

---

*Note: This cheat sheet provides a concise overview of MongoDB commands and deprecated features as of 2024. For detailed information and best practices, consult the official MongoDB documentation.* 