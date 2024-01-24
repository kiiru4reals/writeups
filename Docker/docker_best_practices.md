### Security scanning
Before deploying a container, we should scan the newly built image. To scan a new image docker relies on a service known as [Snyk](https://snyk.io/product/container-vulnerability-management/) to scan our images. To scan our docker image, we can use the following command 
`docker scan <image_name>`
To use this ensure that you are signed in to Docker Hub from docker desktop and signed in to Snyk. To sign in to Snyk, use the following command
`docker scan --login` and follow the instructions.
Once we scan the image, we get the following excerpt
```sh
Testing learning-application...

✗ Medium severity vulnerability found in openssl/libcrypto1.1
  Description: Inadequate Encryption Strength
  Info: https://snyk.io/vuln/SNYK-ALPINE315-OPENSSL-2941810
  Introduced through: openssl/libcrypto1.1@1.1.1n-r0, openssl/libssl1.1@1.1.1n-r0, apk-tools/apk-tools@2.12.7-r3, libretls/libretls@3.3.4-r3, python2/python2@2.7.18-r4
  From: openssl/libcrypto1.1@1.1.1n-r0
  From: openssl/libssl1.1@1.1.1n-r0 > openssl/libcrypto1.1@1.1.1n-r0
  From: apk-tools/apk-tools@2.12.7-r3 > openssl/libcrypto1.1@1.1.1n-r0
  and 6 more...
  Fixed in: 1.1.1q-r0

✗ Critical severity vulnerability found in zlib/zlib
  Description: Out-of-bounds Write
  Info: https://snyk.io/vuln/SNYK-ALPINE315-ZLIB-2976173
  Introduced through: zlib/zlib@1.2.12-r0, apk-tools/apk-tools@2.12.7-r3, gcc/g++@10.3.1_git20211027-r0, python2/python2@2.7.18-r4, gcc/libgomp@10.3.1_git20211027-r0, gcc/libgcc@10.3.1_git20211027-r0
  From: zlib/zlib@1.2.12-r0
  From: apk-tools/apk-tools@2.12.7-r3 > zlib/zlib@1.2.12-r0
  From: gcc/g++@10.3.1_git20211027-r0 > zlib/zlib@1.2.12-r0
  and 3 more...
  Fixed in: 1.2.12-r2
```
The results go on and may vary dpending on the image you are scanning.
### Image layering
You can find out the composition of a docker image using the `docker image history <image_name>` command
We can try to find out the composition of our learning application image.
```sh
ca2026eb54da   19 hours ago   EXPOSE map[3000/tcp:{}]                         0B        buildkit.dockerfile.v0
<missing>      19 hours ago   CMD ["node" "src/index.js"]                     0B        buildkit.dockerfile.v0
<missing>      19 hours ago   RUN /bin/sh -c yarn install --production # b…   86MB      buildkit.dockerfile.v0
<missing>      19 hours ago   COPY . . # buildkit                             4.62MB    buildkit.dockerfile.v0
<missing>      47 hours ago   WORKDIR /app                                    0B        buildkit.dockerfile.v0
<missing>      47 hours ago   RUN /bin/sh -c apk add --no-cache python2 g+…   223MB     buildkit.dockerfile.v0
<missing>      4 months ago   /bin/sh -c #(nop)  CMD ["node"]                 0B        
<missing>      4 months ago   /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B        
<missing>      4 months ago   /bin/sh -c #(nop) COPY file:4d192565a7220e13…   388B      
<missing>      4 months ago   /bin/sh -c apk add --no-cache --virtual .bui…   7.84MB    
<missing>      4 months ago   /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.18     0B        
<missing>      4 months ago   /bin/sh -c addgroup -g 1000 node     && addu…   77.6MB    
<missing>      4 months ago   /bin/sh -c #(nop)  ENV NODE_VERSION=12.22.12    0B        
<missing>      5 months ago   /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      5 months ago   /bin/sh -c #(nop) ADD file:5d673d25da3a14ce1…   5.57MB    
```
### Layer caching
To reduce build-times for our applications, we need to add files that will be constants to a `.dockerignore` file. 