Stored SQL injection is like stored XSS but with SQL statements, but manifests itself when the query is being made to the database and the application retrieves the data in an unsafe manner
Picture a sign up page where the user is asked to submit a username and a password, we can enter the following SQL  statement

```sql
malicioususer';update users set password='password' where user='administrator'--
```

We can then go to the login page and login as `administrator` with the password `password`. The login page will handle the data in the following manner.

```sql
SELECT * FROM users WHERE user='malicioususer';update users set password = 'password' WHERE user='administrator'--
```