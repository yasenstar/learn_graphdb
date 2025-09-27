# Neo4j Fundamentals - 01 Graph Thinking

- [Neo4j Fundamentals - 01 Graph Thinking](#neo4j-fundamentals---01-graph-thinking)
  - [Nodes](#nodes)
    - [Create Nodes with Labels](#create-nodes-with-labels)
    - [Correct Property in a Node](#correct-property-in-a-node)
    - [Add additional labels to one node](#add-additional-labels-to-one-node)
  - [Relationships](#relationships)
    - [One-Way Relationships](#one-way-relationships)
    - [Two-Way Relationships](#two-way-relationships)
  - [Properties](#properties)
    - [Add Properties into Node](#add-properties-into-node)
    - [Add Properties into Relationship](#add-properties-into-relationship)

## Nodes

### Create Nodes with Labels

```SQL
create (:Person {name:"Michael"});
merge (:Person {name:"Sarah"});
create (:Company {name:"Neo4j"});
create (:Location {name:"Sweden"})
```

### Correct Property in a Node

If you want to correct/change one label, e.g. you mistake type "Neorj" for Company label, use SET

```SQL
match (c:Company {name:"Neorj"})
set c.name = "Neo4j"
return c
```

### Add additional labels to one node

```SQL
MATCH (n {name:"Michael"})
SET n:Employee
RETURN n
```

## Relationships

### One-Way Relationships

Standard way to create one relationship a time:

```SQL
MATCH (p:Person {name:"Michael"})
MATCH (c:Company {name:"Neo4j"})
MATCH (l:Location {name:"Sweden"})
CREATE (p)-[:WORKS_AT]->(c)
CREATE (c)-[:FOUNDED_IN]->(l)
RETURN p,c,l
```

You may create two relationship in one single line if they have common node:

```SQL
MATCH (p:Person {name:"Michael"})
MATCH (c:Company {name:"Neo4j"})
MATCH (l:Location {name:"Sweden"})
CREATE (p)-[:WORKS_AT]->(c)-[:FOUNDED_IN]->(l)
RETURN p,c,l
```

### Two-Way Relationships

```SQL
MATCH (p1:Person {name:"Michael"}), (p2:Person {name:"Sarah"})
CREATE (p1)-[:LOVES]->(p2)-[:LOVES]->(p1)
RETURN p1,p2
```

```SQL
MATCH (p1:Person {name:"Michael"}), (p2:Person {name:"Sarah"})
CREATE (p1)-[:MARRIED_TO]->(p2)-[:MARRIED_TO]->(p1)
RETURN p1,p2
```

## Properties

### Add Properties into Node

For Node "Michael", write SET in multiple lines:

```SQL
MATCH (p:Person {name:"Michael"})
SET p.firstName = "Michael",
    p.lastName = "Faraday",
    p.born = "1971-09-22"
RETURN p
```

For Node "Sarah", write SET in one line:

```SQL
MATCH (p:Person {name:"Sarah"})
SET p.firstName = "Sarah", p.lastName = "Faraday", p.maidenName = "Barnard"
RETURN p
```

For Node "Neo4j":

```SQL
MATCH (c:Company {name:"Neo4j"})
SET c.website = "neo4j.com"
RETURN c
```

Similarly, for Node "Sweden":

```SQL
MATCH (l:Location {name:"Sweden"})
SET l.capital = "Stockholm", l.region = "Europe"
RETURN l
```

### Add Properties into Relationship

```SQL
MATCH (p:Person {name:"Michael"})-[w:WORKS_AT]-(c:Company {name:"Neo4j"})
SET w.position = "Engineer"
RETURN p,c
```

---
Updated at: September 27th, 2025