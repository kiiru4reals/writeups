This vulnerability allows an attacker to be able to view and navigate through the file system of a web server.

### Vectors
#### No protection
We can assume that an ecommerce stores images in directory `/var/www/images/` . To read an image it would do the following 

```html
<img src="/image?file=cool.png">
```

The URL loads like this https://site.com/image?file=cool.png. This means that it opens `/var/www/images/cool.png`. We can open the URL to read the following
https://site.com/image?file=../../../etc/passwd and access the `/etc/passwd` file.
#### Strips traversal sequences.
In cases where traversal sequences are blocked, we can use the following sequences on the link.
https://site.com/image?file=....//....//....//etc/passwd. We can also use non-standard encodings to prevent detection such as URL encoding.
#### The filename must start with the base folder.
In cases where the file name must start with the base folder we can add the directory ttraversal sequence after the irequested file as follows
https://site.com/image?file=cool.png../../../etc/passwd 

#### Prevention
