### Introduction
Multi Factor Authentication (MFA) is an authentication method that is based on two things which include:
1. Something that you know. (a password)
2. Something that you have. (Short code sent to your phone)
This form of authentication is good for security however, it is as strong as its implementation. If implemented poorly MFA can bring about more risk which includes but is not limited to Denial of Service and excessive consumption of resources. MFA can also be bypassed and in some cases there is no point of implementing it in the first place.

**Verifying the same factor in two different ways is not MFA**

### Bypassing MFA
#### Incorrect state.
In some cases, MFA might be completely bypassed by a business logic flaw. This happens when a user is logged in and 2FA is required, the user may be required to enter a code that is sent to them. At that point the user might already be in a "logged-in" state and can easily access to other pages without the code.
#### Flawed MFA logic.
In some cases, MFA can be implemented in a way that the user is not verified when completing the second step. Let us take a look at an example
We have a user a user say `ray` Ray will be able to login using his username and password and request for a password, but we can intercept ray's OTP request and change the cookie value (in some cases it could be base64) from `ray` to say `sheila` have an OTP generated for Sheila. We can then perform a bruteforce to get `sheila's` OTP and login using Sheila's account without really knowing Sheila's password.

