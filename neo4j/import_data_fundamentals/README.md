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

| Tool | Illustration |
| --- | --- |
| Data Importer | ![data importer](img/data-importer-clean.png) |
| Cypher and LOAD CSV | ![load csv](img/cypher-load-csv.png) |
| neo4j-admin | ![neo4j-admin](img/neo4j-admin.png)
| ETL tools | [![apache-hop](img/apache-hop.png)](https://hop.apache.org/) |
| Custom Application | A custom application will allow you complete control over the import process and integration with other systems and data sources. |

## 2. Neo4j Data Importer

### 2.1 Data Importer

In order to create nodes using Data Importer, you must do:

- Upload a source file
- Create a node label
- Set a unique identifier for each node
- ... while, you don't have to update any perperty names.

```SQL
LOAD CSV WITH HEADERS FROM 'file:///D://GitHub//learn_graphdb//neo4j//import_data_fundamentals//docs//person-import//persons.csv' AS row
MERGE (p:Person {tmdbId: row.person_tmdbId})
SET
  p.bio = row.bio,
  p.born = row.born,
  p.bornIn = row.bornIn,
  p.died = row.died,
  p.imdbId = row.person_imdbId,
  p.name = row.name,
  p.poster = row.person_poster,
  p.url = row.person_url
```

![import-persons.csv](img/import_persons.png)

### 2.2 Properties and Types

Data Importer allow you to select specific properties to import and assign custom names and data types.

Data Inporter supports following data types to be imported:

| Data Type | Description |
| --- | --- |
| `string` | Text data of variable length |
| `integer` | Whole numbers |
| `float` | Decimal numbers |
| `boolean` | True or False values |
| `datetime` | Data and time values |

You can import multiple properties of different types from the same column in the source file. For example, if your source data contained a field of `string` and `integer` values, you could import both as separate properties.

### 2.3 Add Movie Nodes

Here is the [movies.csv](docs/movies.csv)

```SQL
LOAD CSV WITH HEADERS FROM 'file:///D://GitHub//learn_graphdb//neo4j//import_data_fundamentals//docs//movies.csv' AS row
MERGE (m:Movie {movieId: row.movieId})
SET
  m.title = row.title,
  m.budget = row.budget,
  m.countries = row.countries,
  m.imdbId = row.movie_imdbId,
  m.rating = row.imdbRating,
  m.votes = row.imdbVotes,
  m.languages = row.languages,
  m.plot = row.plot,
  m.poster = row.movie_poster,
  m.released = row.released,
  m.revenue = row.revenue,
  m.runtime = row.runtime,
  m.tmdbId = row.movie_tmdbId,
  m.url = row.movie_url,
  m.year = row.year,
  m.genres = row.genres
```

![import movies](img/import_movies.png)

### 2.4 Unique IDs and Constraints

When you set a unique ID, Data Importer will automatically create a `constraint` and `index` for the property.

```
SHOW CONSTRAINT
SHOW INDEX
```

![show index constraints](img/show_constraint_index.png)

Create Constraint - `movie_imdbId`:

```SQL
CREATE CONSTRAINT movie_imdbId
FOR (m:Movie) REQUIRE (m.imdbId) IS NODE KEY
```

`SHOW CONSTRAINT` as below:

![movie_constraint](img/create_constraint.png)

An index is created automatically for the unique ID property. For example, once you have above query to create a new constraint for unique `movie_imdbId`, a new index is created, see below through `SHOW INDEX`:

![create index](img/create_index.png)

Manually add new index from below Cypher:

```SQL
CREATE RANGE INDEX title_index IF NOT EXISTS
FOR (m:Movie)
ON (m.title)
```

A new `title_index` is added for property `title` in `Movie`, as below through `SHOW INDEX`:

![create index manually](img/create_index_manually.png)

### 2.5 Creating Relationships



### 2.6 Add Directed Relationship
### 2.7 Add Users Ratings
### 2.8 Data Importer Considerations


## 3. Source Data Considerations

### 3.1 Understanding the Source Data
### 3.2 Developing a Data Model
### 3.3 Import your CSV File
