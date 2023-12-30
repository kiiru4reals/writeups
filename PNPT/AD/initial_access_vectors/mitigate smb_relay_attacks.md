1. Enable SMB signing: There is a caveat as it slows computers by upto 15%
2. Disable NTLM authentication on the network but is not 100% because if kerberos stops working it'll default back to NTLM
3. Local admin restriction: This can be used to prevent lateral movement but will create an increase in service desk tickets as people won't be able to perform administrative actions.
4. Account tiering*  **not understood**
