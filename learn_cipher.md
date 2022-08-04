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