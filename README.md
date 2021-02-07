# learn_graphdb

## import csv into neo4j

Using archi model exporting as example, there're 3 standard exports `elements.csv`, `properties.csv` and `relations.csv`.

Following are the structure of these three CSV:

1. elements.csv
   - ID
   - Type
   - Name
   - Documentation
2. properties.csv
   - ID
   - Key
   - Value
3. relations.csv
   - ID
   - Type
   - Name
   - Documentation
   - Source
   - Target

Using below command to try importing `elements.csv`:

```dotnetcli
using periodic commit 10000 load csv with headers from "/home/yasen/archi/elements.csv" as line with line create (:element {ID:line.id,  Type:line.type,  Name:line.name,  Documentation:line.documentation});
```

this is not test pass