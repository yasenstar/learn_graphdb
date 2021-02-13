Create initial DB

```SQL
create
      (eason:Person {name:'Eason', gender:'male', birth_year:2011, title:'Student'}),
      (adhish:Person {name:'Adhish', gender:'male', birth_year:2011, title:'Student'}),
      (justin:Person {name:'Justin', gender:'male', birth_year:2011, title:'Student'}),
      (davidson:Person {name:'Mrs. Davidson', gender:'female', title:'Teacher', class:'Math'}),
      (eason)-[:FRIEND_OF]->(justin),
      (eason)-[:FRIEND_OF]->(adhish),
      (adhish)-[:FRIEND_OF]->(eason),
      (adhish)-[:FRIEND_OF]->(justin),
      (justin)-[:FRIEND_OF]->(eason),
      (justin)-[:FRIEND_OF]->(adhish),
      (davidson)-[:TEACHER_OF]->(eason),
      (davidson)-[:TEACHER_OF]->(adhish),
      (davidson)-[:TEACHER_OF]->(justin),
```

`create (esther:Person {name:'Mme. Esther',gender:'female',title:'Teacher',class:'French'})`

