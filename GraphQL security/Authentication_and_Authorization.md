- GraphQL does not have a way to authenticate and authorize users as an out of the box solution. This leads to the implementation of authentication and authorization using other packages and services. These approaches create two different models of Auth which are:
	- In-band: Use of a login page where the client logs in, the credentials are consumed by the API endpoint and the relevant roles are assigned to the user. This is basically what happens with almost every other application where the application handles authentication completely.
	- Out-of-band: This is where a separate service is used to authenticate and authorize users, this can be an identity provider or another service that handles authentication separately and the GraphQL API just processes other requests.
- The in-band authentication model is more vulnerable to attacks as there are no auth structures put in place for GraphQL, it is actually a recommended to have auth handled on a separate service on GraphQL to reduce the attack surface.
- Authorization and Authentication should also be handled at two separate levels, the gateway layer handles authentication and the business logic layer handles authorization.
### Basic Authentication
- We have basic authentication that is used to authenticate the user using a username and password that is passed on the header as a base-64 that is separated with a colon. A good example is shown below:

```txt
Authorization: YWRtaW46cGFzc3dvcmQ=
```
- This is common in environments where developers want a fast way to authenticate requests. You are likely to find this in staging environments but also in production environments for applications developed by amateur developers.
### OAuth 2.0
- This is an authorization framework that is used to give a user temporary access to a service that is running on HTTP.
- A good example of this is when visits an application and gets a button that says "Sign in with GitHub", 
- OAuth 2.0 has four roles that are required to make it work, they include:
	- Resource owner: This is the entity that has the ability to get data from a protected resource. This could be a person or a machine.
	- Authorization server: This is the entity that is responsible for providing authorization to the resource owner. This could be an identity provider.
	- Resource server: This entity stores or processes the protected information. This is the application or service using HTTP(S).
	- Client: This is the medium the resource owner uses to log on to the application, this could be a web browser,  IoT device or another server.
- Skippy is an esteemed software engineer at your favorite tech company, his workplace has tasked him with building an authentication service using OAuth 2.0 as an authentication protocol (good luck to him by the way!) during his research he learns from his friend that he uses OAuth 2.0 the following the application prompts him to enter his username and password using a login form, this is known as an Authorization request. He then enters his username and password and clicks the sign in button, what he has done is shared an authorization grant. These credentials are shared to the service responsible for Authorization to determine if he has access to the resources on the ticketing platform. If his credentials are correct the authorization service shares an Access token to his client, which he can use to access the protected resource by sending requests to the GraphQL endpoint using this token. 
Note: OAuth 2.0 is used for authorization purposes mostly and not authentication, to supplement OAuth 2.0 we can use Open ID Connect (OIDC), which is an authentication framework built on OAuth 2.0, this combination is known as OIDC with OAuth 2.0.
### JWT
- Access tokens used can be JWT token. This is a standard that is responsible for allowing secure transmission of information.
- JWTs are base64-encoded and are divided into three parts separated by periods (.) which include the header, payload and signature. The header defines the type of token and the signing algorithm.
- Let us look at this JWT as an example
```txt
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDFkMDYwMDg3NmUwNTNjYWZiMDMzN2FiOGM2NWM4ZmNhNGFhZDU4MmU1ZmM2YjNmNTQyMTU5NTYxNzZkMTU4NTQ1ODIwN2E5OGMzNWEwMDIiLCJpYXQiOjE3MTQxNTUzMjAuNzI4MTk3LCJuYmYiOjE3MTQxNTUzMjAuNzI4MjAzLCJleHAiOjE3NDU2OTEzMjAuNzE2MDE4LCJzdWIiOiIxOTgiLCJzY29wZXMiOltdfQ.moImDHY4ZUfhBvZlcCdxhJxtHLY0RPqNvhc_ElG-PadnYtHh7cqgYZnDk6Z3nQgwRnJL4KF3t0EBpbeB0bbTGAvmvHSckzftp26mXPd9KhHlJtKFiCF7VDWbrUCdYNPMZ0B_SxP31sa1ml10BqOiDTN2EwDrAYlss9zulLME4rsAbnGrgRRiQ0NGyjuLRL1DJOtTgVK9SS3TLbqq2II0TC-7tktQqx0y4IAIBsI6WXTnZi-t30VcxPXltAaKqRPe-w_YDAIDNrUtLrGh1lRFlktAIQDbLcd7CloVEIy54eO_tYH5aup5qzP9NXeyyha5QnxBBKAzNB2YDgXpJRDFt5ZjxSXpPFxL-hxtOSR487gQux7eTLhhMddT6oL70qOG8tGQBvO3QSd2x4M8x67V5SI1KmpmG6rt_EnJmBUd8YOJ7oJIo70MaBNYD91jZmC4r7jaG0gvJvpG2dmfu7i7poQdqYJ8Yl4KktmyBTE-WLrFSZvi8cIsL9oNB8m2PFiwBhl_1mXKtW66hwPz89fSNAGerhp1I2JEas70aU-CTBExode4N2UfunmnFDQ2I5bfybF0ZLLEhiEFL8AlfmmPTI2RqEgJuhPyNqVguIoXFLzontyowE083NFgkul2FJ4DjNCnHxQZusY7sGRkCw_FAgf4gWiCrfSUeCmTs7UC4Dw
```
- The decoded header shows us the signing algorithm as RS256 as shown below
![[Pasted image 20240426211844.png]]
- The payload data is shown below:
![[Pasted image 20240426211942.png]]
The `iat` field shows what time the token was generated, the `exp` shows when it expires, the `scope` shows what rights the resource owner has. The `nbf` key in a JWT payload stands for "not before." It indicates the time before which the JWT must not be accepted for processing. In other words, if the current time is earlier than the value specified in the `nbf` key, the JWT should be rejected by the receiving party. This helps ensure that the JWT is not used before it becomes valid, which can be important for security reasons, especially when dealing with time-sensitive operations or sensitive data.
- The last part of the token is a signature which ensures that the JWT token was not tamperted with. 
### Authentication attacks
