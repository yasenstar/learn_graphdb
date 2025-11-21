 Importing Data Fundamentals
(Neo4j GraphAcademy)

# 1 Importing Data into Neo4j

## 1.1 Getting Started

## 1.2 How can I import data into Neo4j?

## 1.3 Tools

### Data Importer

### Cypher and LOAD CSV

### neo4j-admin

### ETL tools

### Custom application

# 2 Neo4j Data Importer

## 2.1 Data Importer

### (1) Access Data Importer

### (2) Creating Nodes

#### (2)-1 Connect to your sandbox

#### (2)-2 Upload a file

#### (2)-3 Create a Person node

#### (2)-4 Update Properties

#### (2)-5 Run the import

### (3) View the data

### (4) Backup your work through "Download model (with data)"

### (5) Import locally through "LOAD CSV"

## 2.2 Properties and Types

### Using Data Importer

### Using "LOAD CSV"

## 2.3 Add Movie Nodes

### Using Data Importer

### Using "LOAD CSV"

## 2.4 Unique IDs and Constraints

### Using Data Importer

### Using Neo4j Desktop

## 2.5 Creating Relationships

### Using Data Importer

### Using "LOAD CSV"

## 2.6 Add Directed Relationship

### Using Data Importer

### Using "LOAD CSV"

## 2.7 Add Users Ratings

### Using Data Importer

### Using "LOAD CSV"

## 2.8 Data Importer Considerations

# 3 Source Data Considerations

## 3.1 Understanding the Source Data

## 3.2 Developing a Data Model

## 3.3 Import your CSV File

## 3.4 Congratulations and Next Steps

# Neo4j Fundamentals

## 1. Graph Thinking

### 1.1 What is Neo4j?

#### Overview

##### Neo4j is a graph database that stores data in a graph.

##### Data is stored as nodes and relationships instead of tables or documents

#### Nodes, Relationships, Labels, and Properties

##### Nodes

###### Create Nodes with Labels

* create (:Person {name:"Michael"});
create (:Person {name:"Sarah"});
create (:Company {name:"Neo4j"});
create (:Location {name:"Sweden"})

###### If you want to correct/change one label, e.g. you mistake type "Neorj" for Company label, use SET

* match (c:Company {name:"Neorj"})
set c.name = "Neo4j"
return c

###### Add additional labels to one node

* MATCH (n {name:"Michael"})
SET n:Employee
RETURN n

##### Relationships

###### One-Way Relationships

* MATCH (p:Person {name:"Michael"})
MATCH (c:Company {name:"Neo4j"})
MATCH (l:Location {name:"Sweden"})
CREATE (p)-[:WORKS_AT]->(c)-[:FOUNDED_IN]->(l)
RETURN p,c,l

###### Two-Way Relationships

* MATCH (p1:Person {name:"Michael"}), (p2:Person {name:"Sarah"})
CREATE (p1)-[:LOVES]->(p2)-[:LOVES]->(p1)
RETURN p1,p2

* MATCH (p1:Person {name:"Michael"}), (p2:Person {name:"Sarah"})
CREATE (p1)-[:MARRIED_TO]->(p2)-[:MARRIED_TO]->(p1)
RETURN p1,p2

##### Properties

###### For Node "Michael"

* MATCH (p:Person {name:"Michael"})
SET p.firstName = "Michael",
    p.lastName = "Faraday",
    p.born = "1971-09-22"
RETURN p

###### For Node "Sarah"

* MATCH (p:Person {name:"Sarah"})
SET p.firstName = "Sarah", p.lastName = "Faraday", p.maidenName = "Barnard"
RETURN p

###### For Node "Neo4j"

* MATCH (c:Company {name:"Neo4j"})
SET c.website = "neo4j.com"
RETURN c

###### For Node "Sweden"

* MATCH (l:Location {name:"Sweden"})
SET l.capital = "Stockholm", l.region = "Europe"
RETURN l

###### For Relation

* MATCH (p:Person {name:"Michael"})-[w:WORKS_AT]-(c:Company {name:"Neo4j"})
SET w.position = "Engineer"
RETURN p,c

### 1.2 Thinking in Graphs

#### The O(n) problem

#### NoSQL Databases

#### Graphs

### 1.3 Graphs Are Everywhere

#### 1736 to the Present Day

#### Uncover Patterns in your Data

#### Knowledge Graphs & Generative AI

#### Routing

## 2. Querying Graphs

### 2.1 Reading Graphs

#### Using Cypher

##### "movies" graph: https://github.com/neo4j-graph-examples/movies

#### Explorer the Graph

##### People

##### Movies

##### User Ratings

### 2.2 Pattern Matching

#### Patterns

##### Nodes

##### Relationships

##### Variables

#### MATCH-ing

### 2.3 Creating Graphs

#### The MERGE Clause

##### Create a Movie node

##### Create a RATED relationship

#### Create Own Nodes/Relation

## 3. Exploring Neo4j

### 3.1 Get Neo4j

#### Neo4j Community - Server and Desktop

### 3.2 Neo4j Tools

#### Console

#### Import

#### Explore

#### Query

### 3.3 Congratulations and Next Steps

## 4. Course Summary

### 4.1 Course Summary

### 4.2 Share Your Achievement

# Cypher_Fundamentals

This course teaches you the essentials of using Cypher, Neo4j’s powerful query language, in as little time as possible.


## 01. Reading Data from Neo4j

### 1.1 Introduction to Cypher

#### What is Cypher?

#### How Cypher works

##### Cypher works by matching patterns in the data.

##### In Cypher, labels, property keys, and variables are case-sensitive.

##### Cypher keywords are not case-sensitive.

##### Cypher best practice
 
Name labels usingCamelCase

 
Name property keys and variables usingcamelCase

 
UseUPPERCASEfor Cypher keywords


### 1.2 Retrieving Nodes

### 1.3 Finding Relationships

### 1.4 Traversing Relationships

### 1.5 Finding Emil

### 1.6 Filtering Queries

### 1.7 Finding Specific Actors

## 02. Writing Data to Neo4j

### 2.1 Creating Nodes

### 2.2 Creating a Node

### 2.3 Creating Relationships

### 2.4 Creating a Relationship

### 2.5 Updating Properties

### 2.6 Adding Properties to a Movie

### 2.7 Merge Processing

### 2.8 Adding or Updating a Movie

### 2.9 Deleting Data

### 2.10 Deleting Emil

# Graph Data Modeling
Fundamentals

## 01 Getting Started

### 01.01 What is Graph Data Modeling?

### 01.02 The Domain

### 01.03 Purpose of the Model

## 02 Modeling Nodes

### 02.01 Modeling Nodes

### 02.02 Creating Nodes

### 02.03 Identifying a New Label

### 02.04 Creating More Nodes

## 03 Modeling Relationships

### 03.01 Modeling Relationships

### 03.02 Creating Initial Relationships

### 03.03 Identifying a New Relationship

### 03.04 Creating More Relationships

## 04 Testing the Model

### 04.01 Testing

### 04.02 Testing with Instance Model

## 05 Refactoring the Graph

### 05.01 Refactoring

### 05.02 Labels in the Graph

### 05.03 Adding the Actor Label

### 05.04 Retesting After Refactoring

### 05.05 Retesting with Actor Label

### 05.06 Adding the Director Label

### 05.07 Avoid These Labels

## 06 Eliminating Duplicate Data

### 06.01 Eliminating Duplicate Data

### 06.02 Adding Language Data

### 06.03 Refactoring Duplicate Data

### 06.04 Adding Language Nodes

### 06.05 Adding Genre (类型) Nodes

### 06.06 Eliminating Complex Data in Nodes

## 07 Using Specific Relationships

### 07.01 Specific Relationships

#### apoc.merge.relationship

### 07.02 Specializing ACTED_IN and DIRECTED Relationships

### 07.03 Specializing RATED Relationships

## 08 Adding Intermediate Nodes

### 08.01 Intermediate Nodes

### 08.02 Adding a Role Node

## 09 Course Summary
