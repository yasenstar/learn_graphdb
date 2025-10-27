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

## 2.4 Creating a Relationship

## 2.5 Updating Properties

## 2.6 Adding Properties to a Movie

## 2.7 Merge Processing

## 2.8 Adding or Updating a Movie

## 2.9 Deleting Data

## 2.10 Deleting Emil
