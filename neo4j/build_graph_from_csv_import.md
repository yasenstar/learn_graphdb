# Using CSV Files Importing to Build Graph DB in Neo4j

- [Using CSV Files Importing to Build Graph DB in Neo4j](#using-csv-files-importing-to-build-graph-db-in-neo4j)
  - [Introduction on the Approach](#introduction-on-the-approach)
  - [Testing Scenarios](#testing-scenarios)
  - [Initialize Project and Database in Neo4j](#initialize-project-and-database-in-neo4j)
  - [1. Load CSV to create new Node with some instances](#1-load-csv-to-create-new-node-with-some-instances)
  - [2. Load CSV to create both two Nodes and mapping relationships together](#2-load-csv-to-create-both-two-nodes-and-mapping-relationships-together)
  - [3. Load CSV to merge more instances to existing Node](#3-load-csv-to-merge-more-instances-to-existing-node)
  - [4. Load CSV to merge more instances and more relationships to existing Node](#4-load-csv-to-merge-more-instances-and-more-relationships-to-existing-node)

## Introduction on the Approach

Database is in Neo4j 1.6.3, target to create graph database from scratch, with following content and data model:

Database purpose: Geographical Region / Country and their Climate Zone Mapping

Node:
- Region: e.g. North America, Africa, Asia etc.
- Country: e.g. Italy, China, Canada etc.
- Climate Zone: 3-char code base on [Koppen Climate Classification](https://en.wikipedia.org/wiki/K%C3%B6ppen_climate_classification)

## Testing Scenarios

1. Load CSV to create new Node with some instances
2. Load CSV to create both two Nodes and mapping relationships together
3. Load CSV to merge more instances to existing Node
4. Load CSV to merge more instances and more relationships to existing Node

Primarily comparing the effect of `CREATE` and `MERGE` in Neo4j Cypher syntax.

## Initialize Project and Database in Neo4j

Create a project in Neo4j 1.6.3 called `Test`, then create one new local_dbms called `import_test`, leave version as 4.24.0, as below:

![create_local_dbms](img/create_local_dbms.png)

After database is created, click the three dots and choose Settings..., as below:

![enter_dbms_settings](img/enter_dbms_settings.png)

## 1. Load CSV to create new Node with some instances

Prepare initial [Region1.csv](csv/region1.csv), with 2 regions under Region header:

```csv
Region
Europe
Asia
```



## 2. Load CSV to create both two Nodes and mapping relationships together

## 3. Load CSV to merge more instances to existing Node

## 4. Load CSV to merge more instances and more relationships to existing Node