### Introduction
1. What is race condition? Race condition is a vulnerability that takes advantage of the multi-threading approach of web applications. To handle a high level of traffic, applications handle different operations using a number of threads to accomodate traffic which exposes them to concurrency risks that may make an application not be able to synchronize different functions at the same time.

### Exploitation
Race conditions are exploited by the use of sending multiple requests at the same time (with a difference of <1 ms), using a single or multiple connections with a good network.
**Time of Check, time of use (TOCTOU)**: This is the flaw that allows race conditions to be exploited as a result of a time factor.
#### Case study.
- An ecommerce site that makes it possible for users to get discounts using a discount code can only be used one time.