Command for testing:

`:play 4.0-intro-neo4j-exercises`

`:play https://guides.neo4j.com/4.0-intro-neo4j-exercises/12.html`

# Exercise 1

Retrive all Nodes: `MATCH (n) RETURN n`

Show Schema: `CALL db.schema.visualization()`

# Exercise 2

## Exercise 2.1: Retrieve all movies that were released in a specific year.

`MATCH (m:Movie) WHERE m.released = 2003 RETURN m`

OR

`MATCH (m:Movie {released:2003}) RETURN m`

## Exercise 2.2: View the retrieved results as a table.

## Exercise 2.3: Query the database for all property keys.

`CALL db.propertyKeys()`

## Exercise 2.4: Retrieve all Movies released in a specific year, returning their titles.

`MATCH (m:Movie {released:2003}) RETURN m.title`

## Exercise 2.5: Display title, released, and tagline values for every Movie node in the graph.

`MATCH (m:Movie) RETURN m.title, m.released, m.tagline`

Ordered by Released year desc:

`MATCH (m:Movie) RETURN m.title, m.released, m.tagline ORDER BY m.released DESC`

## Exercise 2.6: Display more user-friendly headers in the table.

`MATCH (m:Movie) RETURN m.title AS `movie title`, m.released AS released, m.tagline AS tagLine`

# Exercise 3

## Exercise 3.1: Display the schema of the database.

`CALL db.schema.visualization()`

## Exercise 3.2: Retrieve all people who wrote the movie Speed Racer.

`MATCH (p:Person)-[:WROTE]->(:Movie {name:'Speed Racer'}) RETURN p`

Exercise 3.3: Retrieve all movies that are connected to the person, Tom Hanks.

`MATCH (:Person {name:'Tom Hanks'})-[:ACTED_IN]->(m:Movie) RETURN m`

`MATCH (m:Movie)<--(:Person {name:'Tom Hanks'}) RETURN m.title`

`MATCH (:Person {name:'Tom Hanks'})-->(m:Movie) RETURN m.title`

## Exercise 3.4: Retrieve information about the relationships Tom Hanks had with the set of movies retrieved earlier.

`MATCH (:Person {name:'Tom Hanks'})-[r]->(m:Movie) RETURN m.title, type(r)`

## Exercise 3.5: Retrieve information about the roles that Tom Hanks acted in.

`MATCH (m:Movie)-[rel:ACTED_IN]-(:Person {name: 'Tom Hanks'}) RETURN m.title, rel.roles`

# Exercise 4

## Exercise 4.1: Retrieve all movies that Tom Cruise acted in.

Without WHERE: `MATCH (p:Person)-[:ACTED_IN]->(m:Movie) RETURN m.title`

With WHERE: `MATCH (a:Person)-[:ACTED_IN]->(m:Movie) WHERE a.name = 'Tom Cruise' RETURN m.title as Movie`

## Exercise 4.2: Retrieve all people that were born in the 70’s.

`MATCH (p:Person) WHERE p.born>=1970 AND p.born<1980 RETURN p.name as PersonName`

```
MATCH (p:Person) WHERE p.born>=1970 AND p.born<1980 RETURN p.name as `Person Name`, p.born as `Birth Year`
```

## Exercise 4.3: Retrieve the actors who acted in the movie The Matrix who were born after 1960.

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

## Exercise 4.4: Retrieve all movies by testing the node label and a property.

Retrieve all movies released in 2000 by testing the node label and the released property, returning the movie titles.

`MATCH (m:Movie) WHERE m.released=2000 RETURN m.title as Title`

OR

`MATCH (m) WHERE m:Movie AND m.released = 2000 RETURN m.title`

## Exercise 4.5: Retrieve all people that wrote movies by testing the relationship between two nodes.

Retrieve all people that wrote movies by testing the relationship between two nodes, returning the names of the people and the titles of the movies.

`MATCH (p:Person)-[r]->(m:Movie) RETURN p.name, type(r), m.title`

OR

```
MATCH (a)-[rel]->(m)
WHERE a:Person AND type(rel) = 'WROTE' AND m:Movie
RETURN a.name as Name, type(rel), m.title as Movie
```

## Exercise 4.6: Retrieve all people in the graph that do not have a property.

Retrieve all people in the graph that do not have a born property, returning their names.

Here is wrong query: `MATCH (p) WHERE p:Person AND p.born=NULL RETURN p.name`

Should be: `MATCH (a:Person) WHERE NOT exists(a.born) RETURN a.name as Name`

## Exercise 4.7: Retrieve all people related to movies where the relationship has a property.

Retrieve all people related to movies where the relationship has the rating property, then return their name, movie title, and the rating.

```
MATCH (p:Person)-[r:REVIEWED]->(m:Movie)
WHERE exists(r.rating)
RETURN p.name as `Person Name`, m.title as `Movie`, r.rating as Rating
ORDER BY r.rating DESC
```

## Exercise 4.8: Retrieve all actors whose name begins with James.

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

## Exercise 4.9: Retrieve all REVIEW relationships from the graph with filtered results.

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

## Exercise 4.10: Retrieve all people who have produced a movie, but have not directed a movie.

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

## Exercise 4.11: Retrieve the movies and their actors where one of the actors also directed the movie.

Retrieve the movies and their actors where one of the actors also directed the movie, returning the actors names, the director’s name, and the movie title.

```
MATCH (a1:Person)-[:ACTED_IN]->(m:Movie),(a2:Person)-[:ACTED_IN]->(m)
WHERE EXISTS ((a2)-[:DIRECTED]->(m))
RETURN a1.name as Actor, a2.name as `Actor/Director`, m.title as Movie
```

## Exercise 4.12: Retrieve all movies that were released in a set of years.

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

## Exercise 4.13: Retrieve the movies that have an actor’s role that is the name of the movie.

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

## Exercise 5.1: Retrieve data using multiple MATCH patterns.

Write a Cypher query that retrieves all movies that Gene Hackman has acted in, along with the directors of the movies. In addition, retrieve the actors that acted in the same movies as Gene Hackman. Return the name of the movie, the name of the director, and the names of actors that worked with Gene Hackman.

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(q:Person), (a:Person)-[:ACTED_IN]->(m)
WHERE p.name = 'Gene Hackman'
RETURN m.title as Movie, q.name as Director, a.name as `Co-Actors`
```

## Exercise 5.2: Retrieve particular nodes that have a relationship.

Next, you will perform queries for data that is a variable number of hops away.

Write this Cypher query to explore the graph engine’s behavior with varying length paths for the FOLLOWS relationship in the Movie graph:

Retrieve all nodes that the person named James Thompson directly has the FOLLOWS relationship in either direction.

My query:

```
MATCH (p:Person)-[:FOLLOWS]->(q:Person)
WHERE p.name = 'James Thompson' OR q.name = 'James Thompson'
RETURN p.name as Following, q.name as Followed
```

Sample query:

```
MATCH (p1:Person)-[:FOLLOWS]-(p2:Person)
WHERE p1.name = 'James Thompson'
RETURN p1, p2
```

No need '>' so that we can ignore the directior!

## Exercise 5.3: Modify the query to retrieve nodes that are exactly three hops away.

My query: `MATCH (m)-[]-()-[]-(n) RETURN m.name,n.name`, not correct result, list too many!

Correct query:

```
MATCH (p1:Person)-[:FOLLOWS*3]-(p2:Person)
WHERE p1.name = 'James Thompson'
RETURN p1, p2
```

## Exercise 5.4: Modify the query to retrieve nodes that are one and two hops away.

```
MATCH (p1:Person)-[:FOLLOWS*1..2]-(p2:Person)
WHERE p1.name = 'James Thompson'
RETURN p1, p2
```

## Exercise 5.5: Modify the query to retrieve particular nodes that are connected no matter how many hops are required.

Modify the query to retrieve all nodes that are connected to James Thompson by a Follows relationship no matter how many hops are required.

```
MATCH (p1:Person)-[:FOLLOWS*1..]-(p2:Person)
WHERE p1.name = 'James Thompson'
RETURN p1, p2
```

Same as

```
MATCH (p1:Person)-[:FOLLOWS*]-(p2:Person)
WHERE p1.name = 'James Thompson'
RETURN p1, p2
```

## Exercise 5.6: Specify optional data to be retrieved during the query.

Write a Cypher query to return all persons who’s name begins with Tom and optionally return the name of a movie that this person directed.

My query, not considering OPTIONAL:

```
MATCH (p:Person)-[:DIRECTED]->(m:Movie)
WHERE p.name STARTS WITH 'Tom'
RETURN m.title as Movie, p.name as Director
```

Correct query:

```
MATCH (p:Person)
WHERE p.name STARTS WITH 'Tom'
OPTIONAL MATCH (p)-[:DIRECTED]->(m:Movie)
RETURN m.title as Movie, p.name as Director
```

# Exercise 6: Working with Cypher data

## Exercise 6.1: Retrieve nodes and collect a list of movie titles.

Retrieve actors and the movies they have acted in, returning each actor’s name and the list of movies they acted in.

My query:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
RETURN p.name as Actor, m.title as Movie
```

Correct, using `COLLECT` to make a list:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
RETURN p.name as Actor, collect(m.title) as `Movie List`
```

## Exercise 6.2: Retrieve nodes and collect a list of actors.

Retrieve all movies that Tom Cruise has acted in and the co-actors that acted in the same movie, returning the movie title and the list of co-actors that Tom Cruise worked with.

My query:

```
MATCH (p1:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(p2:Person)
WHERE p1.name = 'Tom Cruise' AND p2 <> p1
RETURN m.title as Movie, COLLECT(p2.name) as `Tom's Co-Actor`
```

?: no matter having `AND p2 <> p1`, result is same, the P2 doesn't include 'Tom Cruise`

Sample query:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(p2:Person)
WHERE p.name ='Tom Cruise'
RETURN m.title as movie, collect(p2.name) AS `co-actors`
```

## Exercise 6.3: Collect and count data.

Retrieve all people who reviewed a movie, returning the name of the movie, the list of reviewers, and how many reviewers reviewed the movie.

My query:

```
MATCH (p:Person)-[:REVIEWED]->(m:Movie)
RETURN m.title as Movie, COLLECT(p.name) as Reviewers, COUNT(p.name)
```

Sample query:

```
MATCH (p:Person)-[:REVIEWED]->(m:Movie)
RETURN m.title as movie, count(p) as numReviews, collect(p.name) as reviewers
```

## Exercise 6.4: Collect and count more data.

Retrieve all directors, their movies, and people who acted in the movies, returning the name of the director, the number of actors the director has worked with, and the list of actors.

My query:

```
MATCH (p1:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(p2:Person)
RETURN m.title as Movie, p1.name as Director, COUNT(p2.name) as `# of Actors`, COLLECT(p2.name) as `List of Actors`
```

Actual query:

```
MATCH (d:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(a:Person)
RETURN d.name AS director, count(a) AS `number actors` , collect(a.name) AS `actors worked with`
```

Question: why not using `Movie` to distinct, the actual query returns too many duplicated Actors?

## Exercise 6.5: Return movies as a custom map using map projection.

Write a query that returns a map of all movies that Tom Hanks acted in. The map returned only contains the title of the movie and the year released for the movie.

My query only listing the result:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name = "Tom Hanks"
RETURN DISTINCT  m.title as Movie, m.released as Released
```

Sample query using MAP:

```
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE a.name = 'Tom Hanks'
RETURN  m {.title, .released}
```

## Exercise 6.6: Perform a calculation with the date type.

Write a query that retrieves all movies that Tom Hanks acted in, returning the title of the movie, the year the movie was released, the number of years ago that the movie was released, and the age of Tom when the movie was released.

My query (don't know how to point to current year):

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name = 'Tom Hanks'
RETURN m.title as Movie, m.released as `Released Year`, m.released - p.born
```

Sample query: using `DATE().YEAR` to get current year

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name = 'Tom Hanks'
RETURN m.title as Movie, m.released as `Released Year`, date().year - m.released as `years Ago Released`, m.released - p.born as `Age of Tom`
```

# Exercise 7: Controlling query processing

In this exercise you will write queries that use WITH to chain query results and control processing during queries. You will write queries that use WITH to collect data and then return intermediate results. Then, you will use WITH to limit the number of results returned. Next, you will test the size of a collection, together with the WITH clause to control what results are returned. Then, you will chain results together to test the size to control the results returned. Finally, you will chain results together and unwind a collected list to produce results.

## Exercise 7.1: Using WITH.

Retrieve the actors who have acted in exactly five movies, returning the name of the actor, and the list of movies for that actor.

My query, incorrect:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH count(m) = 5
RETURN p.name as Actor, COLLECT(m.title) as `List of Movies`
```

Correct query:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, count(m) AS numMovies, COLLECT(m.title) AS `List of Movies`
WHERE numMovies = 5
RETURN p.name as Actor, `List of Movies`
```

## Exercise 7.2: Using WITH to limit results returned.

Retrieve all actors that have not appeared in more than 3 movies. Return their names and list of movies

My query, correct:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, count(m) as numOfMovies, COLLECT(m.title) as `List of Movies`
WHERE numOfMovies <= 3
RETURN p.name as Actor, `List of Movies`
```

## Exercise 7.3: Using the size of a retrieval to process the query.

Retrieve the movies that have at least 2 directors, and optionally the names of people who reviewed the movies.

My query:

```
MATCH (p1:Person)-[:DIRECTED]->(m:Movie)
WITH p1, count(p1) as numOfDirectors, m.title as Movie
OPTIONAL MATCH (p2:Person)-[:REVIEWED]->(m)
WHERE numOfDirectors >= 2 AND EXISTS (p2.name)
RETURN Movie, COLLECT(p2.name) as `List of Reviewers`
```

Correct query:

```
MATCH (m:Movie) with m, size((:Person)-[:DIRECTED]->(m)) AS Directors
WHERE Directors >= 2
OPTIONAL MATCH (p:Person)-[:REVIEWED]->(m)
RETURN m.title, p.name
```

## Exercise 7.4: Testing the size of a list.

Write a Cypher query that retrieves all actors that acted in movies, and collects the list of movies for any actor that acted in more than five movies. Return the name of the actor and the list.

My query, not able to list the collection of the moview:

```
MATCH (p:Person)
WITH p, size((p)-[:ACTED_IN]->(:Movie)) as numOfMovies
WHERE numOfMovies > 5
RETURN p.name as Actor
```

Correct query:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, COLLECT(m) AS Movies
WHERE size(Movies) > 5
RETURN p.name as Actor, Movies
```

## Exercise 7.5: Unwinding a list in the query chain.

Modify the query you just wrote so that before the query processing ends, you unwind the list of movies and then return the name of the actor and the title of the associated movie

Hint: Use two WITH clauses and test the size of the collected list using the size() function.

Sample query using `UNWIND`:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, COLLECT(m) AS Movies
WHERE size(Movies) > 5
WITH p, Movies UNWIND Movies AS Movie
RETURN p.name as Actor, Movie.title
```

Further `COLLECT` titles of movies:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, COLLECT(m) AS Movies
WHERE size(Movies) > 5
WITH p, Movies UNWIND Movies AS Movie
RETURN p.name as Actor, COLLECT(Movie.title) AS MovieName
```

# Exercise 8: Controlling results returned

In this exercise, you will write queries where you can customize what results are returned and if they will be sorted. First, you will write a query that eliminates duplication of rows returned. Then you write a query that sorts the data returned. Finally, you will write a query to limit the number of results returned.

## Exercise 8.1: Execute a query that returns duplicate records.

You want to know what actors acted in movies in the decade starting with the year 1990. First write a query to retrieve all actors that acted in movies during the 1990s, where you return the released date, the movie title, and the collected actor names for the movie. For now do not worry about duplication.

My query, OK:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE 1990 <= m.released < 2000
RETURN m.title, m.released, COLLECT(p.name) AS Actors
```

Sample query:

```
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.released >= 1990 AND m.released < 2000
RETURN m.released, m.title, collect(a.name)
```

## Exercise 8.2: Modify the query to eliminate duplication.

The results returned from the previous query include multiple rows for a movie released value. Next, modify the query so that the released date records returned are not duplicated. To implement this, you must add the collection of the movie titles to the results returned.

```
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.released >= 1990 AND m.released < 2000
RETURN m.released, collect(m.title), collect(a.name)
```

## Exercise 8.3: Modify the query to eliminate more duplication.

The results returned from the previous query returns the collection of movie titles with duplicates. That is because there are multiple actors per released year. Next, modify the query so that there is no duplication of the movies listed for a year.

```
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.released >= 1990 AND m.released < 2000
RETURN m.released, collect(DISTINCT m.title), collect(a.name)
```

Note: `DISTINCT` should be within `collect`

## Exercise 8.4: Sort results returned.

Modify the query that you just wrote to order the results returned so that the more recent years are displayed first.

```
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.released >= 1990 AND m.released < 2000
RETURN m.released, collect(DISTINCT m.title), collect(a.name)
ORDER BY m.released DESC
```

## Exercise 8.5: Retrieve the top 5 ratings and their associated movies.

Retrieve the top 5 ratings and their associated movies, returning the movie title and the rating.

My query, do not know how to show "Top 5":

```
MATCH ()-[r:REVIEWED]->(m:Movie)
RETURN m.title AS Movie, r.rating AS Rating
ORDER BY r.rating DESC
```

Correct query, using `LIMIT x` clause:

```
MATCH ()-[r:REVIEWED]->(m:Movie)
RETURN m.title AS Movie, r.rating AS Rating
ORDER BY r.rating DESC LIMIT 5
```

## Exercise 8.6: Return the movies where an actor had the most roles.

What movies did Tom Hanks act in? What roles did he play? Order the results by the movies where he played the most roles.

My query, cannot find correct result:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[r]-(p)
WHERE p.name = 'Tom Hanks'
RETURN m.title as Movie, COUNT(r)
```

Also incorect, should not use `r` as wild indicator of relations:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[r]-(p)
WHERE p.name = 'Tom Hanks'
RETURN m.title as Movie, size(r.roles) AS Size, r.roles
ORDER BY Size DESC
```

Correct query:

```
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE p.name = 'Tom Hanks'
RETURN m.title as Movie, size(r.roles) AS Size, r.roles
ORDER BY Size DESC
```

# Exercise 9: Creating Nodes

In this exercise, you will write Cypher statements to create nodes. Then you will write Cypher statements to add and remove labels for nodes. Next, you will use Cypher to add properties to nodes. Finally, you will write Cypher statements to remove properties from nodes.

## Exercise 9.1: Create a Movie node.

Create a Movie node for the movie with the title, Forrest Gump.

`CREATE (:Movie {title: 'Forrest Gump'})`

## Exercise 9.2: Retrieve the newly-created node.

Retrieve the node you just created by its title.

My query: `MATCH (m:Movie) WHERE m.title = 'Forrest Gump' RETURN m`

## Exercise 9.3: Create a Person node.

Create a Person node for the person with the name, Robin Wright.

`CREATE (:Person {name:'Robin Wright'})`

## Exercise 9.4: Retrieve the newly-created node.

Retrieve the Person node you just created by its name.

`MATCH (p:Person) WHERE p.name='Robin Wright' RETURN p`

## Exercise 9.5: Add a label to a node.

Add the label OlderMovie to any Movie node that was released before 2010.

```
MATCH (m:Movie)
WHERE m.released < 2010
SET m:OlderMovie
RETURN DISTINCT labels(m)
```

## Exercise 9.6: Retrieve the node using the new label.

Retrieve all older movie nodes to test that the label was indeed added to these nodes.

`MATCH (m:OlderMovie) RETURN m.title, m.released ORDER BY m.released DESC`

## Exercise 9.7: Add the Female label to selected nodes.

Add the label Female to all Person nodes that has a person whose name starts with Robin.

My query, wrongly using `STARTS OF`, should be `STARTS WITH`, no need `RETURN`:

```
MATCH (p:Person)
WHERE p.name STARTS OF 'Robin'
SET p:Female
RETURN DISTINCE labels(p)
```

Correct query:

```
MATCH (p:Person)
WHERE p.name STARTS WITH 'Robin'
SET p:Female
```

## Exercise 9.8: Retrieve all Female nodes.

`MATCH (p:Female) RETURN p.name`

Result:

p.name
"Robin Williams"
"Robin Wright"

Do you notice that not all of these nodes should be labeled Female?

Here we see that there are two Person nodes. The Robin Williams node should not have the label Female.

## Exercise 9.9: Remove the Female label from the nodes that have this label.

We’ve decided to not use the Female label. Remove the Female label from the nodes that have this label.

`MATCH (p:Female) REMOVE p:Female`

## Exercise 9.10: View the current schema of the graph.

`CALL db.schema.visualization()`

## Exercise 9.11: Add properties to a movie.

Add the following properties to the movie, Forrest Gump:

- released: 1994
- tagline: Life is like a box of chocolates…​you never know what you’re gonna get.
- lengthInMinutes: 142

Hint: This movie should also have the label OlderMovie.

My query (note: this movie has not yet add the `OlderMovie` tag):

```
MATCH (m:OlderMovie)
WHERE m.title = 'Forrest Gump'
SET
      m.released = 1994,
      m.tagline = "Life is like a box of chocolates...you never know what you're gonna get."
      m.lengthInMinutes = 142
RETURN m.title, m.released, m.tagline, m.lengthInMinutes
```

Correct query:

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
SET
      m:OlderMovie,
      m.released = 1994,
      m.tagline = "Life is like a box of chocolates...you never know what you're gonna get.",
      m.lengthInMinutes = 142
RETURN m.title, m.released, m.tagline, m.lengthInMinutes
```

## Exercise 9.12: Retrieve an OlderMovie node to confirm the label and properties.

```
MATCH (m:OlderMovie)
WHERE m.title = 'Forrest Gump'
RETURN m.title, m.released
```

## Exercise 9.13: Add properties to the person, Robin Wright.

Add the following properties to the person, Robin Wright:

- born: 1966
- birthPlace: Dallas

Using this query to check this person's `born` and `birthPlace` is `NULL` now:

```
MATCH (p:Person)
WHERE p.name = 'Robin Wright'
RETURN p.name, p.born, p.birthPlace
```

Set value to needed properties:

```
MATCH (p:Person)
WHERE p.name = 'Robin Wright'
SET
      p.born = 1996,
      p.birthPlace = 'Dallas'
RETURN p.name, p.born, p.birthPlace
```

## Exercise 9.14: Retrieve an updated Person node.

Retrieve this Person node to confirm that the properties have been properly set.

```
MATCH (p:Person)
WHERE p.name = 'Robin Wright'
RETURN p
```

## Exercise 9.15: Remove a property from a Movie node.

Remove the lengthInMinutes property from the movie, Forrest Gump.

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
SET m.lengthInMinutes = null
RETURN m
```

## Exercise 9.16: Retrieve the node to confirm that the property has been removed.

Retrieve the Forrest Gump node to confirm that the property has been removed.

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN m
```

## Exercise 9.17: Remove a property from a Person node.

Remove the birthPlace property from the person, Robin Wright.

```
MATCH (p:Person)
WHERE p.name = 'Robin Wright'
REMOVE p.birthPlace
```

## Exercise 9.18: Retrieve the node to confirm that the property has been removed.

Retrieve the Robin Wright node to confirm that the property has been removed.

```
MATCH (p:Person)
WHERE p.name = 'Robin Wright'
RETURN p
```

## Exercise 9: Creating Nodes (Taking it further - optional)

Add more labels to the Movie nodes to reflect the movie genre (action, drama, etc.).

Query the database using different labels for movies.

Try adding or updating properties using the JSON-style syntax using = and +=.

Add properties to nodes using the JSON-style format where you add all of the properties to the node.

Query the database to confirm your additions.

Call the Cypher built-in method to retrieve all of the property keys in the graph.

# Exercise 10: Creating Relationships

In the previous exercise, you created nodes, added and removed both properties and labels from nodes. The connections between nodes, the relationships, are one of the most important parts of a Neo4j graph.

In this exercise you will create relationships between nodes. Then you will add properties to relationships. Finally, you will remove properties from relationships.

## Exercise 10.1: Create ACTED_IN relationships.

In the last exercise, you created the node for the movie, Forrest Gump and the person, Robin Wright.

Create the ACTED_IN relationship between the actors, Robin Wright, Tom Hanks, and Gary Sinise and the movie, Forrest Gump.

Using below query to check there're no `ACTED_IN` to this movie:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p.name
```

Actual query:

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
MATCH (p:Person)
WHERE p.name = 'Tom Hanks' OR p.name = 'Robin Wright' OR p.name = 'Gary Sinise'
CREATE (p)-[:ACTED_IN]->(m)
```

Result is `Created 3 relationships, completed after 4 ms.`

## Exercise 10.2: Create a DIRECTED relationship.

Create the DIRECTED relationship between Robert Zemeckis and the movie, Forrest Gump.

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
MATCH (p:Person)
WHERE p.name = 'Robert Zemeckis'
CREATE (p)-[:DIRECTED]->(m)
```

## Exercise 10.3: Create a HELPED relationship.

Create a new relationship, HELPED from Tom Hanks to Gary Sinise.

Query to show two person and knwo there's no relationship between them:

```
MATCH (p1:Person)
WHERE p1.name = 'Tom Hanks'
MATCH (p2:Person)
WHERE p2.name = 'Gary Sinise'
RETURN p1, p2
```

Query of creating new relationship:

```
MATCH (p1:Person)
WHERE p1.name = 'Tom Hanks'
MATCH (p2:Person)
WHERE p2.name = 'Gary Sinise'
CREATE (p1)-[:HELPED]->(p2)
RETURN p1, p2
```

## Exercise 10.4: Query nodes and new relationships.

Write a Cypher query to return all nodes connected to the movie, Forrest Gump, along with their relationships.

My query:

```
MATCH (a)-[]-(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN a
```

Sample query, return all information:

```
MATCH (a)-[]-(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN a
```

Notice here that the HELPED relationship is also shown because Tom Hanks and Gary Sinise are connected and we have Connect result nodes selected in our Neo4j Browser settings.

## Exercise 10.5: Add properties to relationships.

Add the roles property to the three ACTED_IN relationships that you just created to the movie, Forrest Gump using this information: Tom Hanks played the role, Forrest Gump. Robin Wright played the role, Jenny Curran. Gary Sinise played the role, Lieutenant Dan Taylor.

Hint: You can set each relationship using separate MATCH clauses. You can also use a CASE clause to set the values. Look up in the documentation for how to use the CASE clause.

My query:

```
MATCH (a)-[r:ACTED_IN]-(m:Movie)
WHERE m.title = 'Forrest Gump'
WHERE a.name = 'Tom Hanks' SET r.roles = 'Forrest Gump'
WHERE a.name = 'Robin Wright' SET r.roles = 'Jenny Curran'
WHERE a.name = 'Gary Sinise' SET r.roles = 'Lieutenant Dan Taylor'
RETURN a,r
```

Got below error:

```
Invalid input 'H': expected 'i/I' (line 3, column 2 (offset: 65))
"WHERE a.name = 'Tom Hanks' SET r.roles = 'Forrest Gump'"
```

Correct query, using `CASE`:

```
MATCH (a)-[r:ACTED_IN]-(m:Movie)
WHERE m.title = 'Forrest Gump'
SET r.roles =
CASE a.name
  WHEN 'Tom Hanks' THEN ['Forrest Gump']
  WHEN 'Robin Wright' THEN ['Jenny Curran']
  WHEN 'Gary Sinise' THEN ['Lieutenant Dan Taylor']
END
RETURN a,r
```

## Exercise 10.6: Add a property to the HELPED relationship.

Add a new property, research to the HELPED relationship between Tom Hanks and Gary Sinise and set this property’s value to war history.

My query, should not using `CREATE`:

```
MATCH (p1:Person)-[r:HELPED]->(p2:Person)
WHERE p1.name = 'Tom Hanks' AND p2.name = 'Gary Sinise'
CREATE r.research = 'war history'
RETURN p1,p2
```

Sample query:

```
MATCH (p1:Person)-[r:HELPED]->(p2:Person)
WHERE p1.name = 'Tom Hanks' AND p2.name = 'Gary Sinise'
SET r.research = 'war history'
RETURN p1,p2
```

## Exercise 10.7: View the current list of property keys in the graph.

`CALL db.propertyKeys()`

## Exercise 10.8: View the current schema of the graph.

`CALL db.schema.visualization()`

`CALL db.schema.relTypeProperties`

`CALL db.schema.nodeTypeProperties`

## Exercise 10.9: Retrieve the names and roles for actors.

Query the graph to return the names and roles of actors in the movie, Forrest Gump.

My query, incorrect since there's `null` in person's roles:

```
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p.roles
```

Correct query, check `roles` of relationship:

```
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p.name, r.roles
```

## Exercise 10.10: Retrieve information about any specific relationships.

Query the graph to retrieve information about any HELPED relationships.

My query: `MATCH (m)-[:HELPED]->(n) RETURN m,n`, returns the two nodes and relationship

Another: `MATCH (m)-[r:HELPED]->(n) RETURN m.name,r,n.name`, return one relationship

Sample query:

```
MATCH (p1:Person)-[rel:HELPED]-(p2:Person)
RETURN p1.name, rel, p2.name
```

Notice here that 2 results are returned. That is because we did not specify a direction for the relationship in the query. So there is a relationship from Tom Hanks and also to Gary Sinise, even though there is only one physical relationship in the graph. If you specify a direction for the relationship, only one result is returned.

## Exercise 10.11: Modify a property of a relationship.

Modify the role that Gary Sinise played in the movie, Forrest Gump from Lieutenant Dan Taylor to Lt. Dan Taylor.

Query checking the current roles in relationship ACTED_IN:

```
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE p.name = 'Gary Sinise' AND m.title = 'Forrest Gump'
RETURN r.roles
```

My query:

```
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE p.name = 'Gary Sinise' AND m.title = 'Forrest Gump'
SET r.roles = 'Lt. Dan Taylor'
RETURN r.roles
```

Sample query, using `[]`:

```
MATCH (p:Person)-[rel:ACTED_IN]->(m:Movie)
WHERE m.title = 'Forrest Gump' AND p.name = 'Gary Sinise'
SET rel.roles =['Lt. Dan Taylor']
```

## Exercise 10.12: Remove a property from a relationship.

Remove the research property from the HELPED relationship from Tom Hanks to Gary Sinise.

My query, incorrect, should not use `DELETE`:

```
MATCH (p1:Person)-[r:HELPED]->(p2:Person)
WHERE p1.name = 'Tom Hanks' AND p2.name = 'Gary Sinise'
DELETE r.research
RETURN r.research
```

Get error:

```
Neo.ClientError.Statement.TypeError
Expected a Node, Relationship or Path, but got a UTF8StringValue
```

Correct query:

```
MATCH (p1:Person)-[rel:HELPED]->(p2:Person)
WHERE p1.name = 'Tom Hanks' AND p2.name = 'Gary Sinise'
REMOVE rel.research
```

After querying, the result will be `null` for `rel.research`

## Exercise 10.13: Confirm that your modifications were made to the graph.

Query the graph to confirm that your modifications were made to the graph.

My query: `MATCH (p)-[:HELPED]->(q) RETURN p,q`

Sample query:

```
MATCH (p:Person)-[rel:ACTED_IN]->(m:Movie)
WHERE m.title = 'Forrest Gump'
return p, rel, m
```

## Exercise 10: Creating Relationships (Taking it further - optional)

Try adding or updating properties using the JSON-style syntax using = and +=.

# Exercise 11: Deleting Nodes and Relationships

In the previous exercise, you created relationships between Person and Movie nodes and you modified the properties for these relationships.

In this exercise you will delete nodes and relationships from the graph.

## Exercise 11.1: Delete a relationship.

Recall that in the graph we have been working with, we have the HELPED relationship between Tom Hanks and Gary Sinise. We have decided that we no longer need this relationship in the graph.

Delete the HELPED relationship from the graph.

```
MATCH (:Person)-[rel:HELPED]->(:Person)
DELETE rel
```

## Exercise 11.2: Confirm that the relationship has been deleted.

Query the graph to confirm that the relationship no longer exists.

My query: `MATCH (p:Person)-[rel:HELPED]->(q:Person) RETURN p,q`

Get `(no changes, no records)`

## Exercise 11.3: Retrieve a movie and all of its relationships.

Query the graph to display Forrest Gump and all of its relationships.

My query:

```
MATCH (p)-[r]-(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p,r,m
```

Sample query (note: think no need to atd `:Person` since there's no such restriction):

```
MATCH (p:Person)-[rel]-(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p, rel, m
```

## Exercise 11.4: Try deleting a node without detaching its relationships.

We want to remove the movie, Forrest Gump from the graph.

Try deleting the Forrest Gump node without detaching its relationships.

Do you receive an error?

Query:

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
DELETE m
```

Get error:

```
Neo.ClientError.Schema.ConstraintValidationFailed
Cannot delete node<171>, because it still has relationships. To delete this node, you must first delete its relationships.
```

## Exercise 11.5: Delete a Movie node, along with its relationships.

Delete Forrest Gump, along with its relationships in the graph.

```
MATCH (m:Movie)
WHERE m.title = 'Forrest Gump'
DETACH DELETE m
```

Result: `Deleted 1 node, deleted 4 relationships, completed after 3 ms.`

## Exercise 11.6: Confirm that the Movie node has been deleted.

Query the graph to confirm that the Forrest Gump node has been deleted.

```
MATCH (p)-[r]-(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p,r,m
```

Result: `(no changes, no records)`

# Exercise 12: Merging Data in the Graph

You have gained experience creating, modifying, and deleting nodes and relationships.

In this exercise you will add and modify nodes and relationships in the graph by merging data. In some parts of the exercise, you will be creating duplicate nodes and relationships. You will see how in your real application, you should take care not to create duplicate nodes and relationships in your graphs.

## Exercise 12.1: Use MERGE to create a Movie node.

In this Part of the exercise, you will again create the movie, Forrest Gump, update the node, and then merge the data in the graph to create another node with a different label.

Use MERGE to create (ON CREATE) a node of type Movie with the title property, Forrest Gump. If created, set the released property to 1994

My query:

```
MERGE (m:Movie)
SET m.title = 'Forrest Gump', m.released = 1994
```

Get error:

```
Neo.ClientError.Schema.ConstraintValidationFailed
Node(0) already exists with label `Movie` and property `title` = 'Forrest Gump'
```

Correct query:

```
MERGE (m:Movie {title: 'Forrest Gump'})
ON CREATE SET m.released = 1994
RETURN m
```

## Exercise 12.2: Use MERGE to update a node.

Use MERGE to update (ON MATCH) a node of type Movie with the title property, Forrest Gump. If found, set the tagline property to "Life is like a box of chocolates…​you never know what you’re gonna get.".

```
MERGE (m:Movie {title: 'Forrest Gump'})
ON CREATE SET m.released = 1994
ON MATCH SET m.tagline = "Life is like a box of chocolates...you never know what you’re gonna get."
RETURN m
```

## Exercise 12.3: Use MERGE to create a Production node.

Use MERGE to create (ON CREATE) a node of type Production with the title property, Forrest Gump. If created, set the property year to the value 1994.

```
MERGE (p:Production {title:'Forrest Gump'})
ON CREATE SET p.year = 1994
RETURN p
```

Result:

```
{
  "identity": 173,
  "labels": [
    "Production"
  ],
  "properties": {
"title": "Forrest Gump",
"year": 1994
  }
}
```

## Exercise 12.4: Find all labels for nodes with a property value.

Query the graph to find labels for nodes with the title property, Forrest Gump.

My query (doesn't return `labels`): `MATCH (m {title:'Forrest Gump'}) RETURN m`

Sample query:

`MATCH (m {title:'Forrest Gump'}) RETURN labels(m)`

OR

```
MATCH (m)
WHERE m.title = 'Forrest Gump'
RETURN labels(m)
```

## Exercise 12.5: Use MERGE to update a Production node.

Use MERGE to update (ON MATCH) the existing Production node for Forrest Gump to add the company property with a value of Paramount Pictures.

```
MERGE (p:Production {title:'Forrest Gump'})
ON MATCH SET p.company = 'Paramount Pictures'
RETURN p
```

Result in table:

```
{
  "identity": 173,
  "labels": [
    "Production"
  ],
  "properties": {
"company": "Paramount Pictures",
"title": "Forrest Gump",
"year": 1994
  }
}
```

## Exercise 12.6: Use MERGE to add a label to a node.

Use MERGE to add the OlderMovie label to the movie, Forrest Gump.

My query, not correct:

```
MERGE (m:Movie {title:'Forrest Gump'})
ON CREATE m:OlderMovie
```

Correct query:

```
MERGE (m:Movie {title:'Forrest Gump'})
ON MATCH SET m:OlderMovie
RETURN labels(m)
```

Result:

```
labels(m)
["Movie", "OlderMovie"]
```

## Exercise 12.7: Use MERGE to create two nodes and a single relationship.

In this Part of the exercise, you merge data to create relationships.

Execute the following Cypher statement that uses MERGE to create two nodes and a single relationship

`MERGE (p:Person {name: 'Robert Zemeckis'})-[:DIRECTED]->(m {title: 'Forrest Gump'})`

This statement first finds all Person nodes that have only the name property value of Robert Zemeckis. It then finds all nodes with only the title property set to Forrest Gump. There are no Person or other nodes that have only these properties so the graph engine creates them. Then the graph engine creates the relationship between these two nodes. That is, this MERGE operation creates two nodes and a single relationship. If we had provided all of the property values for the nodes, we would not have created the extra nodes.

In fact, you should never create nodes and relationships together like this! This example is here to show you how powerful Cypher can be. A best practice is to create nodes first, then relationships.

Error message:

```
Neo.ClientError.Schema.ConstraintValidationFailed
Node(151) already exists with label `Person` and property `name` = 'Robert Zemeckis'
```

## Exercise 12.8: Use the same MERGE statement to attempt to create two nodes and a single relationship.

Repeat the execution of the previous statement.

It should do nothing. A best practice is to always use MERGE to create relationships to ensure that there will be no duplication in the graph.

`MERGE (p:Person {name: 'Robert Zemeckis'})-[:DIRECTED]->(m {title: 'Forrest Gump'})`

## Exercise 12.9: Find the correct Person node to delete.

Find the correct Person node to delete

You query the nodes before you delete them to ensure you have the correct MATCH clauses.

Execute this query:

```
MATCH (p:Person {name: 'Robert Zemeckis'})-[rel]-(x)
WHERE NOT EXISTS (p.born)
RETURN p, rel, x
```

Need remove `.born` beforehand:

```
MATCH (p:Person {name: 'Robert Zemeckis'})
DELETE p.born
RETURN p
```

## Exercise 12.10: Delete this Person node, along with its relationships.

Delete this Person node, along with its relationships.

```
MATCH (p:Person {name: 'Robert Zemeckis'})--()
WHERE NOT EXISTS (p.born)
DETACH DELETE p
```

Result: `Deleted 1 node, deleted 2 relationships, completed after 1 ms.`

## Exercise 12.11: Find the correct Forrest Gump node to delete.

Find the correct Forrest Gump node to delete by executing this statement:

```
MATCH (m)
WHERE m.title = 'Forrest Gump' AND labels(m) = []
RETURN m, labels(m)
```

## Exercise 12.12: Delete the Forrest Gump node.

Delete this Forrest Gump node.

It should have no relationships, but you can specify DETACH just to be certain.

```
MATCH (m)
WHERE m.title = 'Forrest Gump' AND labels(m)=[]
DETACH DELETE m
RETURN m, labels(m)
```

## Exercise 12.13: Use MERGE to create the DIRECTED relationship.

Use MERGE to create the DIRECTED relationship between Robert Zemeckis and the Movie, Forrest Gump.

My query:

```
MERGE (p:Movie {name:'Robert Zemeckis'})-[r]->(m:Movie {title:'Forrest Gump'})
ON CREATE r:DIRECTED
RETURN p,r,m
```

Get error message:

```
Neo.ClientError.Statement.SyntaxError
Invalid input 'r': expected "SET" (line 2, column 11 (offset: 89))
"ON CREATE r:DIRECTED"
```

Change to:

```
MERGE (p:Movie {name:'Robert Zemeckis'})-[r]->(m:Movie {title:'Forrest Gump'})
SET r:DIRECTED
RETURN p,r,m
```

Get error message:

```
Neo.ClientError.Statement.SyntaxError
Exactly one relationship type must be specified for MERGE. Did you forget to prefix your relationship type with a ':'? (line 1, column 41 (offset: 40))
"MERGE (p:Movie {name:'Robert Zemeckis'})-[r]->(m:Movie {title:'Forrest Gump'})"
                                         ^
```

Change to:

```
MATCH (p:Movie {name:'Robert Zemeckis'})-[r]->(m:Movie {title:'Forrest Gump'})
MERGE (p)-[r:DIRECTED]->(m)
RETURN p,r,m
```

Get error message:

```
Neo.ClientError.Statement.SyntaxError
Variable `r` already declared (line 2, column 12 (offset: 90))
"MERGE (p)-[r:DIRECTED]->(m)"
            ^
```

Corrected query:

```
MATCH (p:Person), (m:Movie)
WHERE p.name = 'Robert Zemeckis' AND m.title = 'Forrest Gump'
MERGE (p)-[:DIRECTED]->(m)
```

## Exercise 12.14: Use MERGE to create the ACTED_IN relationship.

Use MERGE to create the ACTED_IN relationship between the actors, Tom Hanks, Gary Sinise, and Robin Wright and the Movie, Forrest Gump.

My query:

```
MATCH (p:Person), (m:Movie {title:'Forrest Gump'})
WHERE p.name = 'Tom Hanks' OR p.name = 'Gary Sinise' OR p.name = 'Robin Wright'
MERGE (p)-[:ACTED_IN]->(m)
```

Result: `Created 3 relationships, completed after 8 ms.`

Sample query is simpler:

```
MATCH (p:Person), (m:Movie)
WHERE p.name IN ['Tom Hanks','Gary Sinise', 'Robin Wright']
      AND m.title = 'Forrest Gump'
MERGE (p)-[:ACTED_IN]->(m)
```

## Exercise 12.15: Modify the role relationship property.

Modify the relationship property, role for their roles in Forrest Gump:

- Tom Hanks is Forrest Gump
- Gary Sinise is Lt. Dan Taylor
- Robin Wright is Jenny Curran

Hint: Use the CASE clause.

```
MATCH (p:Person)-[r:ACTED_IN]-(m:Movie {title:'Forrest Gump'})
SET r.roles =
CASE p.name
  WHEN 'Tom Hanks' THEN ['Forrest Gump']
  WHEN 'Robin Wright' THEN ['Jenny Curran']
  WHEN 'Gary Sinise' THEN ['Lt. Dan Taylor']
END
RETURN p,r,m
```

## Exercise 12.16: Verify the update.

Write a query to verify what you just updated in the graph.

```
MATCH (p:Person)-[rel:ACTED_IN]->(m:Movie)
WHERE m.title = 'Forrest Gump'
RETURN p.name, rel.roles, m.title
```

# Exercise 13: Defining constraints on your data

## Exercise 13.1: Add a uniqueness constraint to the graph.

Suppose we want to ensure that every Person in the graph must have a unique name.

Add a uniqueness constraint named PersonNameUniqueConstraint to the Person nodes in the graph.

`CREATE CONSTRAINT PersonNameUniqueConstraint ON (p:Person) ASSERT p.name IS UNIQUE`

Error message:

```
Neo.ClientError.Schema.ConstraintAlreadyExists
Constraint already exists: Constraint( id=2, name='constraint_e26b1a8b', type='UNIQUENESS', schema=(:Person {name}), ownedIndex=1 )
```

Check existing CONSTRAINTS, realize this one already exists:

```
CALL db.constraints()
```

Result:

| name | description | details |
| --- | --- | --- |
| "constraint_3044d997" |"CONSTRAINT ON ( movie:Movie ) ASSERT (movie.title) IS UNIQUE" |"Constraint( id=5, name='constraint_3044d997', type='UNIQUENESS', schema=(:Movie {title}), ownedIndex=4 )" |
| "constraint_e26b1a8b" | CONSTRAINT ON ( person:Person ) ASSERT (person.name) IS UNIQUE" | "Constraint( id=2, name='constraint_e26b1a8b', type='UNIQUENESS', schema=(:Person {name}), ownedIndex=1 )" |


## Exercise 13.2: Add an actor to the graph.

## Exercise 13.3: Attempt to add an existence constraint to the Person nodes in the graph.

## Exercise 13.4: Update Person nodes to have a born property.

## Exercise 13.5: Add an existence constraint to the Person nodes in the graph.

## Exercise 13.6: Add Sean Penn to the graph where you do not specify a value for born.

## Exercise 13.7: Add an existence constraint to a relationship in the graph.

## Exercise 13.8: Attempt to add a relationship that violates the constraint.

## xercise 13.9: Add a node key to the graph.

## Exercise 13.10: Add the movie node to the graph.

## Exercise 13.11: Add a similar movie node with slightly different property values.

## Exercise 13.12: Try adding the 2018 movie again.

## Exercise 13.13: Display the list of constraints defined in the graph.

## Exercise 13.14: Drop an existence constraint.