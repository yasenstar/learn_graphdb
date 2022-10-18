# Bloom saved queries for Archi Model

## Neo4j DB Export Setting in Archi tool

![db plug-in neo4j setting](Neo4j-DB-plug-in-setting.png)

Name: Show visualization schema

```sql
call db.schema.visualization
```

View of the schema - "Flower Schema":

![schema](archi-model-schema.png)

Name: Customer Journey Mapping with Application

```sql
match
(a:elements {class:'ApplicationComponent'})-[r:RealizationRelationships]->(c:elements {class:'Capability'})-[s:ServingRelationships]->(j:elements {class:'ValueStream'})-[hasProperty]->(p:property {name:'BizArch Domain'})
return a,r,c,s,j
```