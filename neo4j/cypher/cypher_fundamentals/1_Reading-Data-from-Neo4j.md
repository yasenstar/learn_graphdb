# Chapter 1: Reading Data from Neo4j

- [Chapter 1: Reading Data from Neo4j](#chapter-1-reading-data-from-neo4j)
  - [1.1 Introduction to Cypher](#11-introduction-to-cypher)
    - [What is Cypher?](#what-is-cypher)
    - [How Cypher works](#how-cypher-works)
  - [1.2 Retrieving Nodes](#12-retrieving-nodes)
  - [1.3 Finding Relationships](#13-finding-relationships)
  - [1.4 Traversing Relationships](#14-traversing-relationships)
  - [1.5 Finding Emil](#15-finding-emil)
  - [1.6 Filtering Queries](#16-filtering-queries)
    - [Filtering Queries](#filtering-queries)
    - [What properties does a node or relationship have?](#what-properties-does-a-node-or-relationship-have)
    - [What properties exist in the graph?](#what-properties-exist-in-the-graph)
  - [1.7 Finding Specific Actors](#17-finding-specific-actors)

## 1.1 Introduction to Cypher

Get sample movies database dump from here: https://github.com/neo4j-graph-examples/recommendations

### What is Cypher?

### How Cypher works

Cypher works by matching patterns in the data.

- In Cypher, labels, property keys, and variables are case-sensitive.
- Cypher keywords are not case-sensitive.

Cypher best practice

- Name labels using CamelCase
- Name property keys and variables usingcamelCase
- Use UPPERCASEfor Cypher keywords

## 1.2 Retrieving Nodes

## 1.3 Finding Relationships

## 1.4 Traversing Relationships

## 1.5 Finding Emil

## 1.6 Filtering Queries

### Filtering Queries

- Filtering by node labels
- Filtering using ranges
- Filtering by existence of a property: `IS NOT NULL`
- Filtering by partial strings: `STARTS WITH`, `ENDS WITH`, `CONTAINS`
  - String tests are case-sensitive, so using `toLower()` or `toUpper()` when necessary
- Filtering by patterns in the graph
- Filtering using lists: comma-separated set of values in a `[]` pair
  - Using `IN` to compare a value to an existing list in a graph

### What properties does a node or relationship have?

`keys()` functions returns a list of all property keys for a node.

### What properties exist in the graph?

`CALL db.propertyKeys()` return all the property keys defined in the graph.

## 1.7 Finding Specific Actors
