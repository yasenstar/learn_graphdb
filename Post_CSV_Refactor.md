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
m.genres = split(coalesce(mgenres), "|")