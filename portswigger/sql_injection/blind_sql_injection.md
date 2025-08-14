This is an attack vector where the application does not return any errors within its responses. This technique is a bit difficult to execute but when executed properly, one can still be able to get restricted data.

To perform blind SQL injection, we can do the following:
1. Changing the logic of the query to trigger a detectable difference in the application's response depending on the truth of a single condition.
2. Conditionally triggering a time delay in processing a particular query, allowing you to infer the truth of the condition based on the period an application takes to respond.

To perform blind SQL  one requires:
1. To understand SQL.
2. Ability to automate this attacks.
3. Patience

### Exploiting Blind SQL injection by triggering conditional responses
Suppose we have a SQL query like this one

```sql
SELECT CookieId FROM USERS where CookieId = 'thisisacookie';
```

This query is vulnerable to SQL injection but the results are not returned to the user. However, the application behaves differently depending on whether the query returns any data. To understand how this works, suppose that two values return the following

```sql
xyz' AND '1'='1
xyz' AND '1'='2
```
