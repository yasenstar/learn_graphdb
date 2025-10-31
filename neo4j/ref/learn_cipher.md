MATCH (player:PLAYER) RETURN player

MATCH (coach:COACH) RETURN coach

MATCH (team:TEAM) RETURN team

MATCH (player:PLAYER) WHERE player.name = "LeBron James" RETURN player

MATCH (player:PLAYER {name: "LeBron James"}) RETURN player

MATCH (player:PLAYER) WHERE player.weight >= 120 OR player.height >= 2.25 RETURN player

MATCH (player:PLAYER) WHERE player.height >= 2 RETURN player SKIP 2 LIMIT 2

MATCH (player:PLAYER), (coach:COACH) RETURN player, coach

MATCH (player:PLAYER) - [:PLAYS_FOR] -> (team:TEAM) WHERE team.name = "LA Lakers" RETURN player, team

MATCH (player:PLAYER) - [contract:PLAYS_FOR] -> (team:TEAM) WHERE contract.salary >= 35000000 RETURN player

MATCH (player:PLAYER) - [gamePlayed:PLAYED_AGAINST] -> (:TEAM) RETURN player.name, COUNT(gamePlayer)

MATCH (p:Person {name: 'Michael Cain'})
MATCH (m:Movie {title: 'Batman Begins'})
MERGE (p) - [:ACTED_IN {roles: ['Alfred Penny']}] -> (m)
RETURN p, m

MERGE (p:Person {name: 'Robin Williams'})
ON MATCH
SET p.died = 2014
RETRUN p

MERGE (m:Movie {title: 'Freaky})
ON CREATE
SET m.released = 2020
ON MATCH
SET m.revenue = 15920855
RETURN m

MERGE (p:Person {name: 'McKenna Grace'})
ON CREATE SET p.createdAt = datetime()
ON MATCH SET p.updatedAt = datetime()
SET p.born = 2006
RETURN p

MERGE (p:Person {name: 'Michael Cain'}) - [:ACTED_IN] -> (m:Movie {title: 'The Cider House Rules'}) RETURN p, m

MERGE (p:Person {name: 'Michael Cain'})
MERGE (m:Movie {title: 'The Cider House Rules'})
MERGE (p) - [:ACTED_IN] -> (m)
RETURN p, m

MERGE (p:Person {name: 'Lucille Ball'})
ON MATCH
SET p.born = 1911
RETURN p

MERGE (m:Movie {title: 'Rocketman'})
// perform the ON MATCH setting of the matchedAt property
ON MATCH SET m.matchedAt = datetime()
// perform the ON CREATE setting of the createdAt property
ON CREATE SET m.createdAt = datetime()
// set the undatedAt property
SET m.updatedAt = datetime()
RETURN m

MATCH (p:Person) - [r:ACTED_IN] -> (m:Movie)
WHERE p.name = 'Tom Hanks' AND m.title = 'Apollo 13'
REMOVE r.roles
DELETE r
DELETE m // no relationship first
DETACH DELETE m // delete all relationship first then delete the node

// MATCH (n) DETACH DELETE n;

MERGE (:Movie {title: 'Apollo 13', tmdbId: 568, released: '1995-06-30', imdbRating: 7.6, genres: ['Drama', 'Adventure', 'IMAX']})
MERGE (:Person {name: 'Tom Hanks', tmdbId: 31, born: '1956-07-09'})
MERGE (:Person {name: 'Meg Ryan', tmdbId: 5344, born: '1961-11-19'})
MERGE (:Person {name: 'Danny DeVito', tmdbId: 518, born: '1944-11-17'})
MERGE (:Person {name: 'Jack Nicholson', tmdbId: 514, born: '1937-04-22'})
MERGE (:Movie {title: 'Sleepless in Seattle', tmdbId: 858, released: '1993-06-25', imdbRating: 6.8, genres: ['Comedy', 'Drama', 'Romance']})
MERGE (:Movie {title: 'Hoffa', tmdbId: 10410, released: '1992-12-25', imdbRating: 6.6, genres: ['Crime', 'Drama']})

MERGE (u:User {userID: 534}) SET u.name = "Sandy Jones"
MERGE (v:User {userID: 105}) SET v.name = "Clinton Spencer"

MATCH (sandy:User {name: 'Sandy Jones'})
MATCH (clinton:User {name: 'Clinton Spencer'})
MATCH (apollo:Movie {title: 'Apollo 13'})
MATCH (sleep:Movie {title: 'Sleepless in Seattle'})
MATCH (hoffa:Movie {title: 'Hoffa'})
MERGE (sandy)-[:RATED {rating:5}]->(apollo)
MERGE (sandy)-[:RATED {rating:4}]->(sleep)
MERGE (clinton)-[:RATED {rating:3}]->(apollo)
MERGE (clinton)-[:RATED {rating:3}]->(sleep)
MERGE (clinton)-[:RATED {rating:3}]->(hoffa)

// What people acted in a movie?
MATCH (p:Person)-[:ACTED_IN]-(m:Movie)
WHERE m.title = 'Sleepless in Seattle'
RETURN p.name AS Actor

// What person directed a movie?
MATCH (p:Person)-[:DIRECTED]-(m:Movie)
WHERE m.title = 'Hoffa'
RETURN  p.name AS Director

// What movies did a person act in?
MATCH (p:Person)-[:ACTED_IN]-(m:Movie)
WHERE p.name = 'Tom Hanks'
RETURN m.title AS Movie

// How many users rated a movie?
MATCH (u:User)-[:RATED]-(m:Movie)
WHERE m.title = 'Apollo 13'
RETURN count(*) AS `Number of reviewers`

// Who was the youngest person to act in a movie?
MATCH (p:Person)-[:ACTED_IN]-(m:Movie)
WHERE m.title = 'Hoffa'
RETURN  p.name AS Actor, p.born as `Year Born` ORDER BY p.born DESC LIMIT 1

// What role did a person play in a movie?
MATCH (p:Person)-[r:ACTED_IN]-(m:Movie)
WHERE m.title = 'Sleepless in Seattle' AND
p.name = 'Meg Ryan'
RETURN  r.role AS Role

// What is the highest rated movie in a particular year according in imDB?
MATCH (m:Movie)
WHERE m.released STARTS WITH '1995'
RETURN  m.title as Movie, m.imdbRating as Rating ORDER BY m.imdbRating DESC LIMIT 1

MERGE (casino:Movie {title: 'Casino', tmdbId: 524, released: '1995-11-22', imdbRating: 8.2, genres: ['Drama','Crime']})
MERGE (martin:Person {name: 'Martin Scorsese', tmdbId: 1032})
MERGE (martin)-[:DIRECTED]->(casino)

// What drama movies did an actor act in?
MATCH (p:Person)-[:ACTED_IN]-(m:Movie)
WHERE p.name = 'Tom Hanks' AND
'Drama' IN m.genres
RETURN m.title AS Movie

// What users gave a movie a rating of 5?
MATCH (u:User)-[r:RATED]-(m:Movie)
WHERE m.title = 'Apollo 13' AND
r.rating = 5
RETURN u.name as Reviewer

MATCH (p:Person)
WHERE exists((p)-[ACTED_IN]-())
SET p:Actor

PROFILE MATCH (p:Person)-[:ACTED_IN]-()
WHERE p.born < '1950'
RETURN p.name

MATCH (p:Person)
WHERE exists ((p)-[:ACTED_IN]-())
SET p:Actor

PROFILE MATCH (p:Actor)-[:ACTED_IN]-()
WHERE p.born < '1950'
RETURN p.name

MATCH (apollo:Movie {title: 'Apollo 13', tmdbId: 568, released: '1995-06-30', imdbRating: 7.6, genres: ['Drama', 'Adventure', 'IMAX']})
MATCH (sleep:Movie {title: 'Sleepless in Seattle', tmdbId: 858, released: '1993-06-25', imdbRating: 6.8, genres: ['Comedy', 'Drama', 'Romance']})
MATCH (hoffa:Movie {title: 'Hoffa', tmdbId: 10410, released: '1992-12-25', imdbRating: 6.6, genres: ['Crime', 'Drama']})
MATCH (casino:Movie {title: 'Casino', tmdbId: 524, released: '1995-11-22', imdbRating: 8.2, genres: ['Drama','Crime']})
SET apollo.languages = ['English']
SET sleep.languages =  ['English']
SET hoffa.languages =  ['English', 'Italian', 'Latin']
SET casino.languages =  ['English']

MATCH (m:Movie)
UNWIND m.languages AS language
WITH language, collect(m) AS movies
MERGE (l:Language {name:language})
WITH l, movies
UNWIND movies AS m
with l, m
MERGE (m)-[:IN_LANGUAGE]->(l);
MATCH (m:Movie)
SET m.languages = null

// Adding Language nodes
MATCH (m:Movie)
UNWIND m.languages AS language
WITH language, collect(m) AS movies
MERGE (l:language {name:language})
WITH l, movies
UNWIND movies AS m
WITH l, m
MERGE (m)-[:IN_LANGUAGE]->(l);
MATCH (m:Movie)
SET m.languages = null

// Adding Genre nodes
MATCH (m:Movie)
UNWIND m.genres AS genre
WITH genre, collect(m) AS movies
MERGE (g:Genre {name:genre})
WITH g, movies
UNWIND movies AS m
WITH g, m
MERGE (m)-[:IN_GENRE]->(g)
SET m.genres = null

MATCH (n:Actor)-[:ACTED_IN]->(m:Movie)
CALL apoc.merge.relationship(n,
  'ACTED_IN_' + left(m.released,4),
  {},
  {},
  m ,
  {}
) YIELD rel
RETURN count(*) AS `Number of relationships merged`;

//Find an actor that acted in a Movie
MATCH (a:Actor)-[r:ACTED_IN]->(m:Movie)
// Create a Role node
MERGE (x:Role {name:r.role})
// Create the PLAYED relationship between the Actor and the Role
MERGE (a)-[:PLAYED]->(x)
// Create the IN_MOVIE relationship between the Role and the Movie
MERGE (x)-[:IN_MOVIE]->(m)