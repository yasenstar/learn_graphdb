// Converting string value to date values
MATCH (p:Person)
SET p.born = CASE p.born WHEN "" THEN null ELSE date(p.born) END
WITH p
SET p.died = CASE p.died WHEN "" THEN null ELSE date(p.died) END

MATCH (p:Person) RETURN p.born LIMIT 5

MATCH (p.Person) RETURN p.born.year LIMIT 5

CALL apoc.meta.nodeTypeProperties()

CALL apoc.meta.relTypeProperties()

//  Transform multi-value properties
MATCH (m:Movie) RETURN m.countries, m.languages, m.genres

MATCH (m:Movie)
SET m.countries = split(coalesce(m.countries,""), "|"),
m.languages = split(coalesce(m.languages, ""), "|"),
m.genres = split(coalesce(m.genres), "|")

MATCH (m:Movie) RETURN m.countries, m.languages, m.genres

CALL apoc.meta.nodeTypeProperties()

// Adding labels
MATCH (p:Person)-[:ACTED_IN]->()
WITH DISTINCT p SET p:Actor

MATCH (p:Person)-[:DIRECTED]->()
WITH DISTINCT p SET p:Director

CALL apoc.meta.nodeTypeProperties()
// Same as
CALL apoc.meta.nodeTypeProperties

// Refactoring Properties as Nodes
SHOW CONSTRAINTS

CREATE CONSTRAINT Genre_name ON (g:Genre) ASSERT g.name IS UNIQUE

MATCH (m:Movie)
UNWIND m.genres AS genre
WITH m, genre
MERGE (g:Genre {name:genre})
MERGE (m)-[:IN_GENRE]->(g)

MATCH (m:Movie) SET m.genres = null

CALL db.schema.visualization

// Cypher keyword `UNWIND` is used to expand the elements of a list as rows during a query

// Importing Large Datasets with Cypher
// During importing large CSV file, why do you us `:auto USING PERIOD COMMIT` when you importing data?
// Answer: to reduce the amount of memory needed for the import.

USING PERIODIC COMMIT LOAD CSV WITH HEADERS
FROM 'url-for-CSV-file'
AS row
/// add data to the graph for each row

// Using Neo4j Browser:
:auto USING PERIODIC COMMIT LOAD CSV WITH HEADERS
FROM 'url-for-CSV-file'
AS row
/// add data to the graph for each row