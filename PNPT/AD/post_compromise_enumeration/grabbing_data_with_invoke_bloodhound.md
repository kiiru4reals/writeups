
This can be installed on GitHub through the following link https://github.com/BloodHoundAD/SharpHound.git. 
Install the file on the Windows 10 target. We can the run the following command
```sh
poweshell -ep bypass
```

We can then invoke sharphound by typing the following command

```sh
. .\SharpHound.ps1
```

We can then use Invoke-Bloodhound by typing the following command
```sh
Invoke-BloodHound -CollectionMethod All -Domain <domain_name> -ZipFileName <name_of_your_zip_file.zip>
```

This should run and tell you where the `.zip` file has been stored.