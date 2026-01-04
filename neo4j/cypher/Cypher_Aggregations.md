 Cypher_Aggregations
(Neo4j Graph Academy)

# 1. Understanding Aggregation in Cypher

Aggregation in Cypher means that during a query, the data retrieved is collected or counted. The aggregation of values or counts are either returned from the query or are used as input for the next part of a multi-step query. If you view the execution plan for the query, you will see that rows are returned for a step in the query. The rows that are returned in a query step are an aggregation of property values, nodes, relationships, or paths in the graph. There are some best practices for aggregating data during your query that you can better understand with examples and explanations of how the query works at runtime.


## 1.1 Creating Lists

### A list is an array that contains elements. The elements in a list need not all be of the same type.

### Most queries use collect() to create lists, but there're other functions you can use as well, such as nodes().

#### collect() returns a list of elements, which is used to create a list at any time during the query.

#### When you create a list during the query, aggregation occurs.

### During aggregation, the graph engine typically groups data based upon some value in a row.
 
The non-aggregated value is thegrouping key.


### Collecting Nodes

#### MATCH (m:Movie)

##### This Match retrieve all Movie nodes

#### UNWIND m.languages AS language

##### Each value in the languages property is returned

#### WITH language, collect(m) AS movies

##### Collect the movie nodes and use the value of language as the grouping key. that is all of the movies with a value of English will be collected into a list.

#### MERGE (l:Language {name:language})

##### Create the Language node using the language value

#### WITH l, movies
UNWIND movies AS m

##### With the language value and the list of Movie nodes for that language, we unwind the movie nodes into rows.

#### WITH l, m
MERGE (l)<-[:SPEAKS]-(m)

##### With each language and row for each Movie, we create the relationship between the Language node and the Movie node

### Collecting Relationships

#### Use endNode() to return the node as the end of the relationship

### Collecting paths in a query

#### nodes() function returns the list of all nodes in a path

## 1.2 Creating and Working with Lists

### Movies with 1 or 2 Actors
Return the movies that have one or two actors, return movie title, the year the movie was released and the actors for the movie
Answer: 139

#### MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)
WITH m, collect(a) AS Actors
WHERE size(Actors) = 1 OR size(Actors) = 2
RETURN m.title AS Title, m.released AS ReleasedYear, Actors

## 1.3 Using Aggregation to Count

### count() function performs a count of properties, nodes, relationships, paths, or rows during query processing.

#### count(*) returns the number of rows retrieved in the query

### Count the movie titles that have been rated

#### MATCH (u:User)-[:RATED]->(m:Movie)
RETURN count(DISTINCT m.title)

## 1.4 Counting Nodes - count()

### Write a query return the number of actors who acted in a Comedy movie.
Answer: 6666

#### MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)-[:IN_GENRE]->(g:Genre {name: "Comedy"})
RETURN count(DISTINCT a)

## 1.5 Using Pattern Comprehension

### Pattern comprehension in Cypher enables you to create a list based upon values obtained during a query. It's implemented in Cypher as a subquery.

### Using Cypher's pattern comprehension syntax: [<pattern> | value], we dynamically return a lit using values obtained from the pattern.

### In some cases, pattern comprehension performs better than using collect() because it uses a subquery.

#### A benefit of pattern comprehension is that you don't need to have a collect() stage and you avoid potential cartesian products.

## 1.6 Younger Actors

### PROFILE
MATCH (a:Actor)
WHERE a.born.year >= 1980
// leave off the Movie label to get better performance
WITH a, [(a)-[:ACTED_IN]->(m) WHERE 2000 <= m.year <= 2005 | m.title] AS Movies
WHERE size(Movies) > 0
RETURN a.name as Actor, a.born as Born, Movies

Answer: 55623

# 2. Working with Lists

## 2.01 Scalar List Functions

### Size of a list: size()

#### Return the names of actors who acted in more than 20 movies by creating the list for each other, and then filtering the list by the size:

##### MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH p, collect (m.title) AS MovieTitles
WITH p, MovieTitles, size(MovieTitles) AS NumMovies
WHERE NumMovies >= 20
RETURN p.name AS Actor, NumMovies, MovieTitles ORDER BY NumMovies

### First/Last element of a list

#### Retrieve all movies for the year 2000 and adds them to a list, ordered by released property, then find the first element of the list of node

##### MATCH (m:Movie)
WHERE  date(m.released).year = 2000
WITH m ORDER BY date(m.released)
WITH collect(m) AS Movies
WITH head(Movies) as First
RETURN First.title AS FirstTitle, First.released AS FirstDate

#### Use "last()" to return the last element of a list.

### Using reduce()

#### Retrieve all movie revenue values from movies released in 2000 and creates the Revenues list, then use reduce() with a starting value of 0, adds each elements to return the total of all elements in the list

##### MATCH (m:Movie) WHERE date(m.released).year = 2000
WITH collect(m.revenue) AS Revenues
WITH Revenues, reduce(t=0, r IN Revenues | t + r) AS TotalRevenue
RETURN TotalRevenue, size(Revenues) AS TotalMovies

#### Totaling the ratings for the movie, Toy Story and then returning the average by dividing by the size of the list

##### MATCH (u:User)-[r:RATED]->(m:Movie)
WHERE m.title = "Toy Story"
WITH collect(r.rating) as Ratings
WITH Ratings, reduce(t=0, r in Ratings | t + r) AS TotalRatings
RETURN (round(TotalRatings / size(Ratings),1)) AS AverageRating

#### Flatten a list of lists

##### WITH [[1,2,3], [4,5,6], [7,8,9]] AS StartingList
RETURN reduce(Calc = [], r IN StartingList | Calc + r) AS FlattenedList

#### Retrieve total budget number for all movies that Martin Scorsese directed

##### MATCH (d:Director)-[:DIRECTED]->(m:Movie)
WHERE d.name = "Martin Scorsese"
WITH collect(m.budget) AS Budgets
WITH Budgets, reduce(t = 0, b IN Budgets | t + b) AS TotalBudget
RETURN TotalBudget, size(Budgets) AS TotalMovies

## 2.02 Oldest Actor

### Retrieve the actors who acted in movies in 2000 and who have a value for the born property

#### MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)
WHERE m.year = 2000 AND a.born IS NOT NULL
RETURN DISTINCT a.name AS Actor, a.born AS Born

### Find the Oldest Actor:
1) Sort the actors by the born property
2) Create a lit from the sorted actor nodes
3) Return the name and birth date of the oldest actor

#### MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)
WHERE m.year = 2000 AND a.born IS NOT NULL
WITH a ORDER BY a.born
WITH collect(a) AS Actors
WITH head(Actors) as Oldest
RETURN Oldest.name AS OldestActor, Oldest.born AS OldestBorn

#### Answer: "Ossie Davis", 1917-12-18

## 2.03 Total imdbVotes for Tom Hanks

### Using reduce() to return the total of all imdbVotes for movies that Tom Hanks acted in

#### MATCH (a:Actor {name:"Tom Hanks"})-[:ACTED_IN]->(m:Movie)
WITH collect(m.imdbVotes) AS Votes
WITH Votes, reduce(t=0, v IN Votes | t + v) AS TotalVotes
RETURN TotalVotes

#### Answer 7836629

## 2.04 Functions that Return Lists

### Using range()

#### Generating a range list is useful when creating nodes with an ID

#### Use value 1 to 100 to create Order nodes

##### UNWIND range(1,100) AS i
MERGE (:Order {id: i})

### Reversing the elements of a list: reverse()

#### MATCH (a:Actor)--(m:Movie)
WHERE m.year < 1910
WITH a, count (m) AS NumMovies
WITH NumMovies, [a.name, NumMovies] AS Stats ORDER BY NumMovies
WITH collect(Stats) as AllStats
return AllStats, reverse(AllStats)

##### AllStats

###### [["Henri Delannoy", 1], ["François Lallement", 1], ["Jules-Eugène Legris", 1], ["Georges Méliès", 2]]

##### reverse(AllStats)

###### [["Georges Méliès", 2], ["Jules-Eugène Legris", 1], ["François Lallement", 1], ["Henri Delannoy", 1]]

### Returning all but the first element of a list

#### MATCH (m:Movie)
WHERE date(m.released).year = 2000
WITH m ORDER BY date(m.released)
WITH collect(m) AS Movies
RETURN head(Movies).title AS FirstTitle, head(Movies).released AS FirstDate, size(tail(Movies)) AS SizeOfTail,
tail(Movies)[-1].title AS LastTitle, tail(Movies)[-1].released AS LastDate,
last(Movies).title AS LastTitle1, last(Movies).released AS LastDate1

#### tail()[-1] is same result as last()

### Using split() to create a list form a string

#### LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/importing/MovieDataUnclean.csv' AS row
WITH row.title AS Title, row.languages AS Field, split(row.languages, "|") AS FieldList
RETURN Title, Field, FieldList

### Creating a List of Nodes, nodes()

#### nodes() returns all nodes in the path, then only extract in the nodes with the Movie lable

##### MATCH path = (p:Person {name: 'Elvis Presley'})-[r*4]-(a:Actor)
WITH nodes(path) AS n
UNWIND n AS x
WITH x WHERE x:Movie
RETURN DISTINCT x.title

#### Get nodes that are up to 6 hops away from the Movie "Toy Story", check to make sure that the name property in the node is not null since the node label could be a Movie, and we only interested in Person nodes that have a name property, then return the name of the last node in the list and its distance from the Toy Story node.

##### MATCH (m:Movie {title: "Toy Story"})
MATCH path = (m)-[:ACTED_IN*1..6]-()
WHERE last(nodes(path)).name IS NOT NULL
RETURN last(nodes(path)).name AS LastNode, length(path) AS HopsAway
ORDER BY HopsAway DESC

## 2.05 Latest Movie Review

### Return a list pertaining to the movie "Toy Story", the list will contain the timestamp of when the movie review was done (from the RATING) relationship) and the name of the review, then result is the last person to review the movie.

#### MATCH (m:Movie {title: 'Toy Story'})
MATCH (u:User)-[r:RATED]->(m)
ORDER BY r.timestamp
WITH collect([u.name, r.timestamp]) AS UserRatings
RETURN last(UserRatings)[0]

#### Answer: "Catherine Trujillo"

## 2.06 Reviewed Same Movies

### MATCH path = (u:User {name: 'Catherine Trujillo'})-[:RATED*2]-()
WITH nodes(path) AS n
UNWIND n AS x
WITH x WHERE x:User AND x.name <> 'Catherine Trujillo'
RETURN count(DISTINCT x.name) AS OtherUsers

### Answer: 646

## 2.07 Functions to Transform Element Types

### toStringList(): transform elements to Strings

#### WITH ['abc', False, 1, 1.5, null, datetime(), date(), LocalDateTime(), point({x:2.3, y:4.5})] AS MyList
RETURN toStringList(MyList)

#### Result:
["abc", "false", "1", "1.5", null, "2026-01-03T12:29:50.922Z", "2026-01-03", "2026-01-03T12:29:50.922", "point({x: 2.3, y: 4.5, crs: 'cartesian'})"]

#### The only exception for this function is that null elements will remain null in the target list

### toIntegerList(): produces elements of type Long (known as Integer)

#### WITH ['abc', False, 1, 1.5, null, datetime(), date(), LocalDateTime(), point({x:2.3, y:4.5})] AS MyList
RETURN toIntegerList(MyList)

#### Result:
[null, 0, 1, 1, null, null, null, null, null]

#### Only numeric and Boolean type elements will be transformed.

### toFloatList(): produces elements of type Float

#### WITH ['abc', False, 1, 1.5, null, datetime(), date(), LocalDateTime(), point({x:2.3, y:4.5})] AS MyList
RETURN toFloatList(MyList)

#### Result:
[null, null, 1.0, 1.5, null, null, null, null, null]

#### Only numeric type elements will be transformed.

### toBooleanList(): produces elements of type Boolean

#### WITH ['abc', False, 1, 1.5, null, datetime(), date(), LocalDateTime(), point({x:2.3, y:4.5})] AS MyList
RETURN toBooleanList(MyList)

#### Result:
[null, false, true, null, null, null, null, null, null]

## 2.08 Update Movie Reviews

### Return a list pertaining to the movie, Toy Story, contain the rating value for the RATED relationships for the movie with the title, Toy Story, then transform the value to integers.

#### MATCH ()-[r:RATED]-(m:Movie {title:'Toy Story'})
WITH collect(r.rating) AS Ratings
WITH Ratings, toIntegerList(Ratings) AS RatingsInteger
UNWIND RatingsInteger AS NewRatings
WITH NewRatings WHERE NewRatings = 4
RETURN count(NewRatings)

#### Result: 96

#### MATCH ()-[r:RATED]-(m:Movie {title:'Toy Story'})
WITH collect(r.rating) AS Ratings
WITH Ratings, toIntegerList(Ratings) AS RatingsInteger
RETURN size([x in RatingsInteger WHERE x = 4 | x]) AS Count4

## 2.09 Testing Lists with Predicate Functions

### Test if All elements satisfy the criteria: all()

#### The test here for the list of nodes in the path is whether the year property is greater than 1900 (for a movie node) or whether the node type is an Actor. If this test evaluates to true, then the path is returned.

##### MATCH p = (a:Actor {name:'Meg Ryan'})-[:ACTED_IN*2]-(a2:Actor)
WHERE all(x IN nodes(p) WHERE x.year > 1900 OR x:Actor)
RETURN p

#### Test the paths from Meg Ryan to other actors for movies that wee released in 2000.

##### MATCH p = (a:Actor {name:'Meg Ryan'})-[:ACTED_IN*2]-(a2:Actor)
WHERE all(x IN nodes(p) WHERE date(x.released).year=2000 OR x:Actor)
RETURN p

### Test if one or more elements satisfy the criteria: any()

#### Query returns the paths from Mag Ryan to other actors for movies released in the year 2000

##### MATCH p = (a:Actor {name:'Meg Ryan'})-[:ACTED_IN*2]-(a2:Actor)
WHERE any(x IN nodes(p) WHERE x.year = 2000 )
RETURN p

##### Result: 2 movies

### Test if a list is empty: isEmpty()

#### Returns true is the list is empty

##### MATCH (m:Movie)
WITH collect(m.title) AS Movies
RETURN isEmpty(Movies)

#### Same result

##### MATCH (m:Movie)
WITH collect(m.title) AS Movies
RETURN size(Movies) = 0

### Test if no elements in a list satisfy the criteria: none()

#### Return true if none of the elements satisfy the criteria

##### MATCH p = (a:Actor {name:'Meg Ryan'})-[:ACTED_IN*2]-(a2:Actor)
WHERE none(x IN nodes(p) WHERE x.name = 'Tom Hanks' and x:Actor)
RETURN p

##### This query will return all paths that do not include both Meg Ryan and Tom Hanks. We test whether Tom Hanks is in the path and if he is not, then the path is returned. If you were to run this query where you comment out the AND clause, you will see that more paths are returned.

### Test if at most a single element satisfy the criteria: single()

#### MATCH p = (a:Actor {name:'Tom Hanks'})-[:ACTED_IN*2]-(a2:Actor)
WHERE single(x IN nodes(p) WHERE x.born.year = a.born.year and x:Actor)
RETURN a.name, a.born.year, a2.name, a2.born.year

## 2.10 Tom Hanks Movies in 1995

### Query to return the paths to other actors from Tom Hanks where the movie was released in 1995, how many path?

#### MATCH p = (a:Actor {name:'Tom Hanks'})-[:ACTED_IN*2]-(a2:Actor)
WHERE all(x IN nodes(p) WHERE x.year=1995 OR x:Actor)
RETURN count(p)

#### Answer: 6

## 2.11 Using List Comprehension to Aggregate

### List comprehension enables you to extract values from an existing list.
 (see:MATCH ()-[r:RATED]-(m:Movie {title:'Toy Story'})
WITH collect(r.rating) AS Ratings
WITH Ratings, toIntegerList(Ratings) AS RatingsInteger
RETURN size([x in RatingsInteger WHERE x = 4 | x]) AS Count4)
#### you can create a list by evaluating an expression that tests for list inclusion.

#### you can modify the values returned in the list

### Return a subset of the list where the values in the countries list property are either USA or Germany or both:

#### MATCH (m:Movie)
RETURN m.title AS MovieTitle,
[x IN m.countries WHERE x CONTAINS 'USA' OR x CONTAINS 'Germany'| x] AS COUNTRY

### Modify the values that are returned in the list:

#### MATCH (m:Movie)-[:ACTED_IN]-(a:Actor)
WHERE toLower(a.name) = 'tom hanks'
WITH m ORDER BY m.released DESC
WITH collect(m) AS Movies
WITH [x IN Movies | x.title + ": " + toString(date().year-x.year+1)] AS Summary
UNWIND Summary as MovieAge
RETURN MovieAge

### return the list of titles and release dates for the movies of an actor. Each row returned will contain the name of the actor and a list containing the title and release date for a movie. The title and release date element will be of the format "title: release date". Use the dropdown below to select the correct code to complete this query.

#### MATCH (a:Actor)--(m:Movie)
WITH a, collect(m) AS Movies
RETURN a.name AS Actor, size(Movies) as NumMovies,
[x in Movies | x.title + ": " + toString(x.released)] AS TitleRelease
LIMIT 100

## 2.12 Ages of Actors in Movies

### return a list containing the ages of the actors for the Movie Toy Story. The age you return is the age of the actor when the movie was released.

What is the age at the time the movie was released of the oldest actor who acted in this movie?

#### MATCH (a:Actor)-[:ACTED_IN]->(m:Movie {title:'Toy Story'})
WITH a, m, collect(a.born.year) AS ActorBornYear
RETURN a.name, [x in ActorBornYear | m.year - x] AS ActorAge
ORDER BY ActorAge DESC

#### Answer: "Don Rickles", [69]

# 3. Aggregating Functions

## 3.1 Adding Values - sum()

### Using sum() to add values

#### PROFILE MATCH (m:Movie)
WHERE m.year = 2000
RETURN sum(m.revenue) as GrossRevenue

#### In this query, the value returned is of type float since at least one of the values being totaled is of type float:

##### WITH [1, 1.5,2] as Nums
UNWIND Nums AS  x
RETURN sum(x)

#### retrieve the number of movies Toy Story has in common with each genre name. For each movie we aggregate to create a total for the imdbRating for each movie. Then we return the genre name, the number of movies in common, and the average score. Here we determine the average by dividing the sum by the number of movies. You will learn about the Cypher avg() function in the next lesson.

##### MATCH (:Movie {title:'Toy Story'})-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(m:Movie)
WHERE m.imdbRating IS NOT NULL
WITH g.name AS Genre, count(m) AS MoviesInCommon, sum(m.imdbRating) AS Total
RETURN Genre, MoviesInCommon, Total/MoviesInCommon AS Score
ORDER BY Score DESC

### Use sum() for durations

#### retrieve all Actor nodes with a name that begins with "Tom". We collect the durations between the birth date and now. We then UNWIND the list of durations to aggreate the values using sum(). We return the sum, but we can also use the calcuated sum to return the average age.

##### MATCH (a:Actor)
WHERE
a.born IS NOT NULL
AND a.name STARTS WITH 'Tom'
WITH count(a) AS NumActors, collect(duration.between(date(a.born), date())) AS Ages
UNWIND Ages AS x
WITH NumActors, sum(x) AS TotalAges
RETURN  TotalAges, TotalAges/NumActors

## 3.2 Years Since Movie Reviewed

### Calculate the average number of years between the release of a movie and when it was reviewed, answer what is average time in years between the release date and when the movie was reviewed by Angela Thompson.

#### MATCH (u:User {name:'Angela Thompson'})-[r:RATED]->(m:Movie)
RETURN sum(datetime({epochSeconds:r.timestamp}).year - m.year) / count(m)

#### Answer: 14

#### MATCH (u:User {name:'Angela Thompson'})-[r:RATED]->(m:Movie)
WITH count(m) as NumMovies, collect(duration.between(datetime({epochseconds:r.timestamp}), date(m.released))) AS ReviewPeriods
UNWIND ReviewPeriods AS x
WITH NumMovies, sum(x) AS TotalReviewPeriod
RETURN TotalReviewPeriod / NumMovies / 12

##### Result: P-14M-3DT-54469.754901958S

##### question: cannot show 14 year directly

## 3.3 Averaging Values - avg() / stddev()

### Using avg() to average values

#### PROFILE MATCH (m:Movie)
WHERE m.year = 2000
RETURN avg(m.revenue) as AvgRevenue

#### If the values used for avg() contain nulls, then that element is not used in the calculation.

##### WITH [1,3, null] as Nums
UNWIND Nums AS x
RETURN avg(x)

#### The subquery returns 10 Movie nodes of movies released in 2000 with the highest imdbRating. Then with these 10 movies, it determines the average rating for each of these 10 movies.

##### CALL {
  MATCH (m:Movie {year:2000})
  RETURN m ORDER BY m.imdbRating DESC LIMIT 10
}
MATCH (:User)-[r:RATED]->(m)
RETURN m.title as Movie, avg(r.rating) AS AverageRating

#### return the average of the User ratings for all movies released in 2000

##### MATCH (u:User)-[r:RATED]->(m:Movie {year:2000})
RETURN avg(r.rating)

### avg() and eager aggregation

#### A best practice in a query is to aggregate early.

##### PROFILE MATCH (m:Movie)
WITH avg(m.imdbVotes) as AverageVote
MATCH (m2:Movie)
WHERE m2.year = 2010 AND m2.imdbVotes > AverageVote
RETURN AverageVote AS OverallAverageVote, m2.title AS Title , m2.imdbVotes AS AverageVote

###### The call to avg() requires that all movie nodes are retrieved before the next step in the execution plan.

##### MATCH (u:User {name: "Misty Williams"})-[r:RATED]->(:Movie)
WITH u, avg(r.rating) AS average
MATCH (u)-[r:RATED]->(m:Movie)
WHERE r.rating > average
RETURN average , m.title AS movie,
r.rating as rating
ORDER BY rating DESC

###### we first calculate the average rating for all movies that Misty Williams rated. Then we use this calculated value, Average as a test for the second MATCH.

### Using avg() for durations

#### MATCH (a:Actor)
WHERE
a.born IS NOT NULL
AND a.name STARTS WITH 'Tom'
WITH count(a) AS NumActors, collect(duration.between(date(a.born), date())) AS Ages
UNWIND Ages AS x
WITH  NumActors, sum(x) AS TotalAges, avg(x) AS AverageAge
RETURN  TotalAges, TotalAges/NumActors, AverageAge

##### MATCH (a:Actor)
WHERE
a.born IS NOT NULL
AND a.name STARTS WITH 'Tom'
WITH count(a) AS NumActors, collect(duration.between(date(a.born), date())) AS Ages
UNWIND Ages AS x
WITH  NumActors, sum(x) AS TotalAges, avg(x) AS AverageAge
RETURN  TotalAges.years, TotalAges.years/NumActors, AverageAge.years

#### To Convert Duration to years:

#####  MATCH (a:Actor)
 WHERE
 a.born IS NOT NULL
 AND a.name STARTS WITH 'Tom'
 WITH count(a) AS NumActors, collect(duration.between(date(a.born), date())) AS Ages
 UNWIND Ages AS x
 WITH NumActors,
      sum(x.years + x.months / 12.0 + x.days / 365.0) AS TotalAgesInYears,
      avg(x.years + x.months / 12.0 + x.days / 365.0) AS AverageAgeInYears
 RETURN TotalAgesInYears, TotalAgesInYears/NumActors AS AverageAgeCalculated, AverageAgeInYears

###### x.years: The years component of the duration.

x.months / 12.0: Converts months into years by dividing by 12.

x.days / 365.0: Converts days into a year fraction by dividing by 365 (approximating a year as 365 days).

### Calculating standard deviation

#### stddev(): uses a sample of the values for an unbiased estimate

#### stddevP(): uses the exact population of values so for accuracy, this function should be used

## 3.4 Average Reviews per User

### Write a query to returns the average number of reviews of movies per user.

What is average number of reviews for all users? (enter an integer number)

#### MATCH (u:User)-[r:RATED]->(m:Movie)
RETURN count(r)/count(DISTINCT u)

##### Answer: 149
But not using Avg()

####  MATCH (u:User)-[r:RATED]-(m:Movie)
 WITH u, count(r) AS NumReviews
 WITH collect(NumReviews) AS ReviewCounts
 UNWIND ReviewCounts AS x
 RETURN toInteger(avg(x))

## 3.5 Calculating Min/Max Values - min() / max()

### Mixed element types

#### A numeric value is always greater than a string or list value. This query returns 2 because it is the greatest numeric value.

##### UNWIND [[2],0,"a",2,[1]] AS x
RETURN max(x)

#### String values are always greater than a list value. Because strings are always greater than lists, this query returns "b"

##### UNWIND [["a"],"a","b",[1]] AS x
RETURN max(x)

### List element comparisons

#### If lists are being compared, the elements are compared in the order in the list. This query returns [1,3,5] because the element comparison of the second element is greatest and no other elements in the list are compared.

##### UNWIND [[1,2,12], [1,3,5]] AS x
RETURN max(x)

### Using min() / max() effectively

#### they're eager aggregation

##### MATCH (m:Movie)
WITH max(m.imdbVotes) AS TopVotes
MATCH (m:Movie) WHERE m.imdbVotes = TopVotes
RETURN m.title, m.imdbVotes, m.imdbRating

#### Improved query

##### PROFILE MATCH (m:Movie)
WHERE m.imdbVotes IS NOT NULL
RETURN m.title, m.imdbVotes ORDER by m.imdbVotes DESC LIMIT 1

### Use of indexes

#### If the property that you are comparing with min() or max() has an index on it, the index is used to return the value which is very efficient.

## 3.6 Movies with Lowest Ratings

### determine the lowest rating a user gave to a movie and return the user name, rating, and movie title for that low rating.

How many rows are returned?

#### MATCH ()-[r:RATED]-()
WITH min(r.rating) as LowRating
MATCH (u:User)-[r]->(m:Movie)
WHERE r.rating = LowRating
RETURN u.name, r.Rating, m.title

#### Answer: 1101

## 3.7 Working with Percentages and Percentiles

### Calculating a percentage

#### What percentage of movies released in 2000 had a rating > 4?

##### MATCH (m:Movie) WHERE m.year = 2000
WITH count(*) AS TotalMovies
MATCH ()-[r:RATED]-(m) where r.rating > 4 AND m.year = 2000
WITH count(DISTINCT m) AS GoodMovies, TotalMovies
RETURN TotalMovies, GoodMovies, GoodMovies/TotalMovies AS PercentGood

##### MATCH (m:Movie) WHERE m.year = 2000
WITH count(*) AS TotalMovies
MATCH ()-[r:RATED]-(m) where r.rating > 4 AND m.year = 2000
WITH count(DISTINCT m) AS GoodMovies, TotalMovies
RETURN TotalMovies, GoodMovies, round(toFloat(GoodMovies) / toFloat(TotalMovies) * 100) AS PercentGood

##### MATCH (m:Movie) WHERE m.year = 2000
WITH count(*) AS TotalMovies
MATCH ()-[r:RATED]-(m) where r.rating > 4 AND m.year = 2000
WITH count(DISTINCT m) AS GoodMovies, TotalMovies
RETURN TotalMovies, GoodMovies, round(toFloat(GoodMovies) / toFloat(TotalMovies),2) AS PercentGood

### Determine a percentile value from a list: percentileCont()

#### evaluate a set of numeric values to determine the value that is at a percentile within the values. The calculation is done where the values are ordered. Then the element in the list that is at the correct percentile is returned. If the percentile is between two values, the average of the two values is returned.

### Using percentileDisc() to select the nearest value from the list, rather than calculating an average if the two values are different

## 3.8 75% of Actors Born After a Year

### returns the year after which 75% of all Actors were born.

What year is returned?

#### MATCH (a:Actor)
WITH collect(a.born.year) AS ActorBorn
UNWIND ActorBorn AS x
RETURN percentileDisc(x, 0.75)

#### Answer: 1972
