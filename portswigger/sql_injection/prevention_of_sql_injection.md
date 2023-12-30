Most cases of SQL injection can be prevented by the use of parameterized queries, nelow is an example of a query that is not parameterized and one that is parameterized.

```js
String query = "SELECT * FROM products WHERE category = '"+ input +"'";
Statement statement = connection.createStatement(); 
ResultSet resultSet = statement.executeQuery(query);
```

Parameterized statement

```js
PreparedStatement statement = connection.prepareStatement("SELECT * FROM products WHERE category = ?"); 
statement.setString(1, input); ResultSet resultSet = statement.executeQuery();
```

For this to make sense every constant has to be hardcoded and the developers should not be tempted to decide whether an item should work on a case-by-case basis.

