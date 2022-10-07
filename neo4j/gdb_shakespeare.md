# Graph DB - Shakespeare Words

# DB Creation

Create the base of the DB:

```cypher
create (shakespeare:Author {firstname:'William', lastname:'Shakespeare'}),
       (juliusCaesar:Play {title:'Julius Caesar'}),
       (shakespeare)-[:WROTE_PLAY {year:1599}]->(juliusCaesar),
       (theTempest:Play {title:'The Tempest'}),
       (shakespeare)-[:WROTE_PLAY {year:1610}]->(theTempest),
       (rsc:Company {name:'RSC'}),
       (production1:Production {name:'Julius Caesar'}),
       (rsc)-[:PRODUCED]->(production1),
       (production1)-[:PRODUCTION_OF]->(juliusCaesar),
       (performance1:Performance {date:20120729}),
       (performance1)-[:PERFORMANCE_OF]->(production1),
       (production2:Production {name:'The Tempest'}),
       (rsc)-[:PRODUCED]->(production2),
       (production2)-[:PRODUCTION_OF]->(theTempest),
       (performance2:Performance {date:20061121}),
       (performance2)-[:PERFORMANCE_OF]->(production2),
       (performance3:Performance {date:20120730}),
       (performance3)-[:PERFORMANCE_OF]->(production1),
       (billy:User {name:'Billy'}),
       (review:Review {rating:5, review:'This was awesome!'}),
       (billy)-[:WROTE_REVIEW]->(review),
       (theatreRoyal:Venue {name:'Theatre Royal'}),
       (performance1)-[:VENUE]->(theatreRoyal),
       (performance2)-[:VENUE]->(theatreRoyal),
       (performance3)-[:VENUE]->(theatreRoyal),
       (greyStreet:Street {name:'Grey Street'}),
       (theatreRoyal)-[:STREET]->(greyStreet),
       (newcastle:City {name:'Newcastle'}),
       (greyStreet)-[:CITY]->(newcastle),
       (tyneAndWear:County {name:'Tyne and Wear'}),
       (newcastle)-[:COUNTY]->(tyneAndWear),
       (england:Country {name:'England'}),
       (tyneAndWear)-[:COUNTRY]->(england),
       (stratford:City {name:'Stratford upon Avon'}),
       (stratford)-[:COUNTRY]->(england),
       (rsc)-[:BASED_IN]->(stratford),
       (shakespeare)-[:BORN_IN]->(stratford)
```

## Index and Constraints

__IMPORTANT TO KNOW:__

Identifiers remains available __ONLY__ for the duration of the __CURRENT__ query scope, but no longer! Should we wish to give long-lived names to nodes, we can simply create an index for a particular label and key property combination.

For unique property values we can also specify constraints that assure uniqueness. With Shakespeare graph, where we need to look up venues directly, we might choose to index all nodes labeled `venue` based on their `name` property value. The command to do this is:

`CREATE INDEX ON :Venue(name)`

To ensure that all country names are unique, we can add an uniqueness constraint:

`CREATE CONSTRAIT ON (c:Country) ASSERT c.name IS UNIQUE`

## DB Query

Query returns all the Shakespeare plays that have been performed at the Theatre Royal in Newcastle:

```cypher
MATCH (theater:Venue {name:'Theatre Royal'}),
      (newcastle:City {name:'Newcastle'}),
      (bard:Author {lastname:'Shakespeare'}),
      (newcastle)<-[:STREET|CITY*1..2]-(theatre)<-[:VENUE]-()
      -[:PERFORMANCE_OF]->()-[:PRODUCTION_OF]->(play)<-[:WROTE_PLAY]-(bard)
RETURN DISTINCT play.title AS play
```

The result is:

| play |
|---|
|"The Tempest"|
|"Julius Caesar"|

Memo:

- The identifiers `newcastle`, `theater`, and `bard` are anchored to real nodes in the graph based on the specified lable and property values.

## Constraining Matches via `WHERE`

We add a `WHERE` clause that filters on above relationship's year property:

```SQL
MATCH (theater:Venue {name:'Theatre Royal'}),
      (newcastle:City {name:'Newcastle'}),
      (bard:Author {lastname:'Shakespeare'}),
      (newcastle)<-[:STREET|CITY*1..2]-(theatre)<-[:VENUE]-()-[:PERFORMANCE_OF]->()
      -[:PRODUCTION_OF]->(play)<-[w:WROTE_PLAY]-(bard)
WHERE w.year > 1608
RETURN DISTINCT play.title AS play
```

The result is:

| play |
|---|
|"The Tempest"|

## Processing Query Results

If we want to rank the plays by the number of performances, we will need first to bind the `PERFORMANCE_OF` relationship in the `MATCH` clause to an identifier, called `p`, which we can then `count` and `order`:

```
MATCH (theater:Venue {name:'Theatre Royal'}),
      (newcastle:City {name:'Newcastle'}),
      (bard:Author {lastname:'Shakespeare'}),
      (newcastle)<-[:STREET|CITY*1..2]-(theatre)<-[:VENUE]-()-[p:PERFORMANCE_OF]->()
      -[:PRODUCTION_OF]->(play)<-[:WROTE_PLAY]-(bard)
RETURN play.title AS play, count(p) AS performance_count
ORDER BY performance_count DESC
```

The result now is

| play | performance_count
| --- | :---: |
|"Julius Caesar"| 2 |
|"The Tempest"| 1 |

