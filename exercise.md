Command for testing:

`:play 4.0-intro-neo4j-exercises`

# Exercise 1

Retrive all Nodes: `MATCH (n) RETURN n`

Show Schema: `CALL db.schema.visualization()`

# Exercise 2

Exercise 2.1: Retrieve all movies that were released in a specific year.

`MATCH (m:Movie) WHERE m.released = 2003 RETURN m`

OR

`MATCH (m:Movie {released:2003}) RETURN m`

Exercise 2.2: View the retrieved results as a table.

Exercise 2.3: Query the database for all property keys.

`CALL db.propertyKeys()`

Exercise 2.4: Retrieve all Movies released in a specific year, returning their titles.

`MATCH (m:Movie {released:2003}) RETURN m.title`

Exercise 2.5: Display title, released, and tagline values for every Movie node in the graph.

`MATCH (m:Movie) RETURN m.title, m.released, m.tagline`

Ordered by Released year desc:

`MATCH (m:Movie) RETURN m.title, m.released, m.tagline ORDER BY m.released DESC`

Exercise 2.6: Display more user-friendly headers in the table.

`MATCH (m:Movie) RETURN m.title AS `movie title`, m.released AS released, m.tagline AS tagLine`

# Exercise 3

Exercise 3.1: Display the schema of the database.

`CALL db.schema.visualization()`

Exercise 3.2: Retrieve all people who wrote the movie Speed Racer.

`MATCH (p:Person)-[:WROTE]->(:Movie {name:'Speed Racer'}) RETURN p`

Exercise 3.3: Retrieve all movies that are connected to the person, Tom Hanks.

`MATCH (:Person {name:'Tom Hanks'})-[:ACTED_IN]->(m:Movie) RETURN m`

`MATCH (m:Movie)<--(:Person {name:'Tom Hanks'}) RETURN m.title`

`MATCH (:Person {name:'Tom Hanks'})-->(m:Movie) RETURN m.title`

Exercise 3.4: Retrieve information about the relationships Tom Hanks had with the set of movies retrieved earlier.

`MATCH (:Person {name:'Tom Hanks'})-[r]->(m:Movie) RETURN m.title, type(r)`

Exercise 3.5: Retrieve information about the roles that Tom Hanks acted in.

`MATCH (m:Movie)-[rel:ACTED_IN]-(:Person {name: 'Tom Hanks'}) RETURN m.title, rel.roles`

# Exercise 4

Exercise 4.1: Retrieve all movies that Tom Cruise acted in.

Without WHERE: `MATCH (p:Person)-[:ACTED_IN]->(m:Movie) RETURN m.title`

With WHERE: `MATCH (a:Person)-[:ACTED_IN]->(m:Movie) WHERE a.name = 'Tom Cruise' RETURN m.title as Movie`

Exercise 4.2: Retrieve all people that were born in the 70’s.

`MATCH (p:Person) WHERE p.born>=1970 AND p.born<1980 RETURN p.name as PersonName`

```
MATCH (p:Person) WHERE p.born>=1970 AND p.born<1980 RETURN p.name as `Person Name`, p.born as `Birth Year`
```

Exercise 4.3: Retrieve the actors who acted in the movie The Matrix who were born after 1960.

```
MATCH (p:Person)-[:ACTED_IN]->(:Movie {title:'The Matrix'})
WHERE p.born>1960
RETURN p.name as `Person Name`
```

OR

```
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE a.born > 1960 AND m.title = 'The Matrix'
RETURN a.name as Name, a.born as `Year Born`
```

Exercise 4.4: Retrieve all movies by testing the node label and a property.

Retrieve all movies released in 2000 by testing the node label and the released property, returning the movie titles.

`MATCH (m:Movie) WHERE m.released=2000 RETURN m.title as Title`

OR

`MATCH (m) WHERE m:Movie AND m.released = 2000 RETURN m.title`

Exercise 4.5: Retrieve all people that wrote movies by testing the relationship between two nodes.

Retrieve all people that wrote movies by testing the relationship between two nodes, returning the names of the people and the titles of the movies.

`MATCH (p:Person)-[r]->(m:Movie) RETURN p.name, type(r), m.title`

OR

```
MATCH (a)-[rel]->(m)
WHERE a:Person AND type(rel) = 'WROTE' AND m:Movie
RETURN a.name as Name, type(rel), m.title as Movie
```

Exercise 4.6: Retrieve all people in the graph that do not have a property.

Retrieve all people in the graph that do not have a born property, returning their names.

Below is wrong query:

`MATCH (p) WHERE p:Person AND p.born=NULL RETURN p.name`

Should be:

`MATCH (a:Person) WHERE NOT exists(a.born) RETURN a.name as Name`

Exercise 4.7: Retrieve all people related to movies where the relationship has a property.



Exercise 4.8: Retrieve all actors whose name begins with James.

Exercise 4.9: Retrieve all REVIEW relationships from the graph with filtered results.

Exercise 4.10: Retrieve all people who have produced a movie, but have not directed a movie.

Exercise 4.11: Retrieve the movies and their actors where one of the actors also directed the movie.

Exercise 4.12: Retrieve all movies that were released in a set of years.

Exercise 4.13: Retrieve the movies that have an actor’s role that is the name of the movie.

