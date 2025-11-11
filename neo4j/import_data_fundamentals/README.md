# Neo4j - Importing Data Fundamentals

- [Neo4j - Importing Data Fundamentals](#neo4j---importing-data-fundamentals)
  - [Contents](#contents)
  - [1. Importing Data into Neo4j](#1-importing-data-into-neo4j)
    - [1.1 Getting Started](#11-getting-started)
    - [1.2 How can I import data into Neo4j?](#12-how-can-i-import-data-into-neo4j)
    - [1.3 Tools](#13-tools)
  - [2. Neo4j Data Importer](#2-neo4j-data-importer)
    - [2.1 Data Importer](#21-data-importer)
    - [2.2 Properties and Types](#22-properties-and-types)
    - [2.3 Add Movie Nodes](#23-add-movie-nodes)
    - [2.4 Unique IDs and Constraints](#24-unique-ids-and-constraints)
    - [2.5 Creating Relationships](#25-creating-relationships)
    - [2.6 Add Directed Relationship](#26-add-directed-relationship)
    - [2.7 Add Users Ratings](#27-add-users-ratings)
    - [2.8 Data Importer Considerations](#28-data-importer-considerations)
  - [3. Source Data Considerations](#3-source-data-considerations)
    - [3.1 Understanding the Source Data](#31-understanding-the-source-data)
    - [3.2 Developing a Data Model](#32-developing-a-data-model)
    - [3.3 Import your CSV File](#33-import-your-csv-file)

## Contents

![TOC](img/TOC.png)

Learning objectives:

- Creating nodes, labels, relationships, and properties from data in **CSV** files.
- Setting **unique** IDs and **constraints**.
- Creating **indexes** to improve query performance.

## 1. Importing Data into Neo4j

### 1.1 Getting Started

Neo4j Data Importer: https://data-importer.neo4j.io/

Neo4j Sandbox: https://sandbox.neo4j.com/

### 1.2 How can I import data into Neo4j?

The source may expose data in different ways, for example:

- Relational Database Management Systems (RDBMS)
- Web APIs
- Public data directories
- BI tools
- Excel
- Flat files (CSV, JSON, XML)

The method by which you import data into Neo4j will depend on several factors, including:

- The source of the data
- The volume of data
- The frequency of the import
- The complexity of the data model
- The transformation required

The options available to you are numerous, and include:

- One-off batch import of all data
- One-off load with a regular update
- Continuous import of data
- Real-time application updates
- ETL (Extract, Transform, Load) pipelines

Potential options and tools for data importing:

![import data charts](img/import-data-charts.svg)

### 1.3 Tools



## 2. Neo4j Data Importer

### 2.1 Data Importer
### 2.2 Properties and Types
### 2.3 Add Movie Nodes
### 2.4 Unique IDs and Constraints
### 2.5 Creating Relationships
### 2.6 Add Directed Relationship
### 2.7 Add Users Ratings
### 2.8 Data Importer Considerations


## 3. Source Data Considerations

### 3.1 Understanding the Source Data
### 3.2 Developing a Data Model
### 3.3 Import your CSV File
