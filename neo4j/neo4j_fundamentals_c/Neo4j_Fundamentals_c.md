 Neo4j
图像数据库入门

# 1. 图形化思考
Graph Thinking

## 1.1 Neo4j是什么？
What is Neo4j?

### 总览
Overview

#### Neo4j是一种将数据储存于图形中的图形数据库
Neo4j is a graph database that stores data in a graph.

#### 有别于关系型数据库中数据以表的方式存储，和其他NoSQL数据库中直接存储文档对象，图像数据库以解读和关系的方式存储数据
Data is stored as nodes and relationships instead of tables or documents

### 节点，关系，标签和属性
Nodes, Relationships, Labels, and Properties

#### 节点
Nodes

##### Create Nodes with Labels

###### create (:Person {name:"Michael"});
create (:Person {name:"Sarah"});
create (:Company {name:"Neo4j"});
create (:Location {name:"Sweden"})

##### If you want to correct/change one label, e.g. you mistake type "Neorj" for Company label, use SET

###### match (c:Company {name:"Neorj"})
set c.name = "Neo4j"
return c

##### Add additional labels to one node

###### MATCH (n {name:"Michael"})
SET n:Employee
RETURN n

#### 关系
Relationships

##### One-Way Relationships

###### MATCH (p:Person {name:"Michael"})
MATCH (c:Company {name:"Neo4j"})
MATCH (l:Location {name:"Sweden"})
CREATE (p)-[:WORKS_AT]->(c)-[:FOUNDED_IN]->(l)
RETURN p,c,l

##### Two-Way Relationships

###### MATCH (p1:Person {name:"Michael"}), (p2:Person {name:"Sarah"})
CREATE (p1)-[:LOVES]->(p2)-[:LOVES]->(p1)
RETURN p1,p2

###### MATCH (p1:Person {name:"Michael"}), (p2:Person {name:"Sarah"})
CREATE (p1)-[:MARRIED_TO]->(p2)-[:MARRIED_TO]->(p1)
RETURN p1,p2

#### 属性
Properties

##### For Node "Michael"

###### MATCH (p:Person {name:"Michael"})
SET p.firstName = "Michael",
    p.lastName = "Faraday",
    p.born = "1971-09-22"
RETURN p

##### For Node "Sarah"

###### MATCH (p:Person {name:"Sarah"})
SET p.firstName = "Sarah", p.lastName = "Faraday", p.maidenName = "Barnard"
RETURN p

##### For Node "Neo4j"

###### MATCH (c:Company {name:"Neo4j"})
SET c.website = "neo4j.com"
RETURN c

##### For Node "Sweden"

###### MATCH (l:Location {name:"Sweden"})
SET l.capital = "Stockholm", l.region = "Europe"
RETURN l

##### For Relation

###### MATCH (p:Person {name:"Michael"})-[w:WORKS_AT]-(c:Company {name:"Neo4j"})
SET w.position = "Engineer"
RETURN p,c

## 1.2 用图形来思考
Thinking in Graphs

### The O(n) problem

### NoSQL Databases

### Graphs

## 1.3 图形无处不在
Graphs Are Everywhere

### 1736 to the Present Day

### Uncover Patterns in your Data

### Knowledge Graphs & Generative AI

### Routing

# 2. 查询图形数据库
Querying Graphs

## 2.1 Reading Graphs

### Using Cypher

#### "movies" graph: https://github.com/neo4j-graph-examples/movies

### Explorer the Graph

#### People

#### Movies

#### User Ratings

## 2.2 Pattern Matching

### Patterns

#### Nodes

#### Relationships

#### Variables

### MATCH-ing

## 2.3 Creating Graphs

### The MERGE Clause

#### Create a Movie node

#### Create a RATED relationship

### Create Own Nodes/Relation

# 3. Neo4j概览
Exploring Neo4j

## 3.1 获取和安装Neo4j
Get Neo4j

### Neo4j Community - Server and Desktop

## 3.2 Neo4j的相关工具
Neo4j Tools

### Console

### Import

### Explore

### Query

## 3.3 祝贺与下一步
Congratulations and Next Steps

# 4. 课程回顾
Course Summary

## 4.1 课程总结
Course Summary

## 4.2 分享你的成就
Share Your Achievement
