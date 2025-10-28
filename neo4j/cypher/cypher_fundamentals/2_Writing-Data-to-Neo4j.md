# Chapter 2: Writing Data to Neo4j

- [Chapter 2: Writing Data to Neo4j](#chapter-2-writing-data-to-neo4j)
  - [2.1 Creating Nodes](#21-creating-nodes)
    - [Creating Nodes](#creating-nodes)
    - [Using `CREATE` instead of `MERGE`](#using-create-instead-of-merge)
  - [2.2 Creating a Node](#22-creating-a-node)
  - [2.3 Creating Relationships](#23-creating-relationships)
  - [2.4 Creating a Relationship](#24-creating-a-relationship)
  - [2.5 Updating Properties](#25-updating-properties)
  - [2.6 Adding Properties to a Movie](#26-adding-properties-to-a-movie)
  - [2.7 Merge Processing](#27-merge-processing)
    - [Customizing `MERGE` behavior](#customizing-merge-behavior)
  - [2.8 Adding or Updating a Movie](#28-adding-or-updating-a-movie)
  - [2.9 Deleting Data](#29-deleting-data)
  - [2.10 Deleting Emil](#210-deleting-emil)

![Domain Model](img/movie-schema.svg)

## 2.1 Creating Nodes

### Creating Nodes

We use `MERGE` keyword to create a *pattern* in the graph database, after `MERGE`, we specify the pattern that we want to create.

### Using `CREATE` instead of `MERGE`

The benefit of using `CREATE` is that it does not look up the primary key before adding the node. You can use `CREATE` if you are sure your data is clean and you want greater speed during import. We use `MERGE` because it eliminates duplication of nodes.

## 2.2 Creating a Node

## 2.3 Creating Relationships

When creating a relationship between two nodes, it must have:

- Type
- Direction

When querying relationship, you need not specify direction in the `MATCH` pattern since the query engine will look for all nodes that are connected, regardless of the direction of the relationship.

When in `MERGE` clause and you do not specify the direction during creating the relationship, it will ALWAYS be assumed left-to-right.

## 2.4 Creating a Relationship

## 2.5 Updating Properties

There're two ways that you can set a property for a node or relationship:

1. Inline as part of the `MERGE` clause: use JSON-style of adding the property key/value paris in braces `{...}`
2. Using the `SET` keyword for a reference to a node or relationship

If you need to set multiple properties, you separate them with a comma (,).

If you have a reference to a node or relationship, you can also use `SET` to modify the property.

You can remove or delete a property from a node or relationship by using the `REMOVE` keyword, or setting the property to `null`.

## 2.6 Adding Properties to a Movie

## 2.7 Merge Processing

`MERGE` operations work by first trying to find a pattern in the graph, if the pattern is found then the data already exists and is not created; if the pattern is not found, then the data can be created.

### Customizing `MERGE` behavior

You can specify behavior at runtime that enables you to set properties when the node is created or when the node is found.

We can use the `ON CREATE SET` or `ON MATCH SET` conditions, or the `SET` keywords to set any additional properties.

Below example, if the *Person* node for *McKenna Grace* does not exist, it is created and the *createdAt* property is set; if the node is found, then the *updatedAt* property is set; in both cases, the *born* property is set.

```SQL
MERGE (p:Person {name: 'McKenna Grace'})
ON CREATE SET p.createdAt = datetime()
ON MATCH SET p.updatedAt = datetime()
SET p.born = 2006
RETURN p
```

## 2.8 Adding or Updating a Movie

## 2.9 Deleting Data

In Neo4j database, you can delete nodes, relationships, properties and labels. The keyword is `DELETE`.

Neo4j provides a feature where you CANNOT delete a node if it has incoming or outgoing relationships, to delete both relationship and the node, use `DETACH DELETE` to the node.

To remove the label, keyword is `REMOVE`.

## 2.10 Deleting Emil
