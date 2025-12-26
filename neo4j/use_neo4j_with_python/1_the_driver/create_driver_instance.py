from neo4j import GraphDatabase

NEO4J_URI = "neo4j://localhost:7687" # also can be "neo4j://127.0.0.1:7687"
NEO4J_USERNAME = "neo4j"
NEO4J_PASSWORD = "@WSX3edc"

driver = GraphDatabase.driver(
    NEO4J_URI,
    auth=(NEO4J_USERNAME, NEO4J_PASSWORD)
)

try:
    driver.verify_connectivity()
    print("Connection to Neo4j Successfully!")
except Exception as e:
    print(f"Failed to connect to Neo4j: {e}")

cypher = """
MATCH (s:山)
RETURN s.name
"""

records, summary, keys = driver.execute_query(
    cypher,
    database_="shanhaijing"   # if not indicate here, the detaul database will be "neo4j"
)

print(keys)

print(summary)

# Method 1 to print Records

# for record in records:
#     print(record['Item'])
#     print(record['UserName'])

# Method 2 to print Records

# results = [record for record in records]
# print(results)

# Method 3 to pring Records

for record in records:
    print(record.data())

driver.close()