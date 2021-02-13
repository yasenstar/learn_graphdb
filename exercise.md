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

Here is wrong query: `MATCH (p) WHERE p:Person AND p.born=NULL RETURN p.name`

Should be: `MATCH (a:Person) WHERE NOT exists(a.born) RETURN a.name as Name`

Exercise 4.7: Retrieve all people related to movies where the relationship has a property.

Retrieve all people related to movies where the relationship has the rating property, then return their name, movie title, and the rating.

```
MATCH (p:Person)-[r:REVIEWED]->(m:Movie)
WHERE exists(r.rating)
RETURN p.name as `Person Name`, m.title as `Movie`, r.rating as Rating
ORDER BY r.rating DESC
```

Exercise 4.8: Retrieve all actors whose name begins with James.

Retrieve all actors whose name begins with James, returning their names.

```
MATCH (p:Person)-[:ACTED_IN]->()
WHERE p.name STARTS WITH 'James'
RETURN p.name
```

Retrieve all actors whose name ends with Hunts, and no duplication.

```
MATCH (p:Person)-[:ACTED_IN]->()
WHERE p.name ENDS WITH 'Hunt'
RETURN DISTINCT p.name
```

Exercise 4.9: Retrieve all REVIEW relationships from the graph with filtered results.

Retrieve all REVIEWED relationships from the graph where the summary of the review contains the string fun, returning the movie title reviewed and the rating and summary of the relationship.

Hint: You do not know what case the fun string will be in the summary text.

Below query doesn't providing result:

```
MATCH ()-[r:REVIEWED]->(m:Movie)
WHERE r.summary CONTAINS 'fun'
RETURN m.title, m.rating, m.summary
```

Here is the correct query:

```
MATCH ()-[r:REVIEWED]->(m:Movie)
WHERE toLower(r.summary) CONTAINS 'fun'
RETURN m.title, r.rating, r.summary
```

Retrieve all movies in the database that have love in their tagline and return the movie titles

```
MATCH ()-[r]->(m:Movie)
WHERE toLower(m.tagline) CONTAINS 'love'
RETURN DISTINCT m.title
```

Retrieve movies in the database, specifying a regular expression for the content of the tagline.

Hint: retrieve all of the taglines of the movies to see what you can search for:

`match ()-[r]-(m:Movie) return m.tagline`

Exercise 4.10: Retrieve all people who have produced a movie, but have not directed a movie.

Retrieve all people who have produced a movie, but have not directed a movie, returning their names and the movie titles.

Not correct query:

```
MATCH (p:Person)-[]->(m:Movie)
WHERE p.roles <> 'Directed' AND p.roles='Produced'
RETURN p.name, m.title
```

Correct query:

```
MATCH (p:Person)-[:PRODUCED]->(m:Movie)
WHERE NOT ((p)-[:DIRECTED]->(:Movie))
RETURN p.name, m.title
```

Exercise 4.11: Retrieve the movies and their actors where one of the actors also directed the movie.

Retrieve the movies and their actors where one of the actors also directed the movie, returning the actors names, the director’s name, and the movie title.

```
MATCH (a1:Person)-[:ACTED_IN]->(m:Movie),(a2:Person)-[:ACTED_IN]->(m)
WHERE EXISTS ((a2)-[:DIRECTED]->(m))
RETURN a1.name as Actor, a2.name as `Actor/Director`, m.title as Movie
```

Exercise 4.12: Retrieve all movies that were released in a set of years.

Retrieve all movies that were released in the years 2000, 2004, and 2008, returning their titles and release years.

```
MATCH (m:Movie)
WHERE m.released= 2000 OR m.released=2004 OR m.released=2008
RETURN m.title, m.released
```

OR

```
MATCH (m:Movie)
WHERE m.released IN [2000, 2004, 2008]
RETURN m.title, m.released
```

Here is the ones NOT in above years:

```
MATCH (m:Movie)
WHERE NOT (m.released IN [2000, 2004, 2008])
RETURN m.title, m.released
```

Exercise 4.13: Retrieve the movies that have an actor’s role that is the name of the movie.

Retrieve the movies that have an actor’s role that is the name of the movie, return the movie title and actor’s name

Wrong query:

```
MATCH (p:Person)-[]->(m:Movie)
WHERE p.roles = m.name
RETURN m.title, p.name
```

Correct Query:

```
MATCH (a:Person)-[r:ACTED_IN]->(m:Movie)
WHERE m.title in r.roles
RETURN  m.title as Movie, a.name as Actor
```

# Exercise 5: Working with patterns in queries

Exercise 5.1: Retrieve data using multiple MATCH patterns.

Write a Cypher query that retrieves all movies that Gene Hackman has acted in, along with the directors of the movies. In addition, retrieve the actors that acted in the same movies as Gene Hackman. Return the name of the movie, the name of the director, and the names of actors that worked with Gene Hackman.

Exercise 5.2: Retrieve particular nodes that have a relationship.

Exercise 5.3: Modify the query to retrieve nodes that are exactly three hops away.

Exercise 5.4: Modify the query to retrieve nodes that are one and two hops away.

Exercise 5.5: Modify the query to retrieve particular nodes that are connected no matter how many hops are required.

Exercise 5.6: Specify optional data to be retrieved during the query.