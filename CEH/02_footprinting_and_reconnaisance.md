Footprinting is the process of getting information about a target network.
### Types of footprinting
#### Active footprinting
More hands-on form of reconnaissance as it involves direct interaction with the target network and can be picked up by monitoring tools. Some of these actions may include:
1. Conducting whois searches.
2. Doing a network scan.
3. Fuzzing websites.
4. Spidering and mirroring websites.
#### Passive footprinting
This is the collection of information on a target without directly interacting with the target. This can be done using:
1. Social media.
2. Looking at the website.
3. Reading financial reports.
4. Looking at job descriptions for technical staff.
### Objectives of footprinting
When we carry out footprinting, we have the following objectives:
1. To find vulnerabilities.
2. To gain organizational information.
3. To gain network information.
4. To draw a network map.
5. Reducing focus areas.
### Footprinting threats.
The following is made possible after conducting footprinting:
1. Information leakage.
2. Easy network attacks.
3. Social engineering.
4. Corporate espionage.

### Footprinting methodology.
Footprinting can be done using different methods such as:
1. Footprinting through search engines.
2. Through social networks.
3. Through web services.
4. From the website.

#### Search engine footprinting
Search Engine foot printing is used to find information about a target that can be used to refine their target. A search engine reveals more information about a target that may be useful to the attacker.
##### Google Dorks
Google dorking is the art of using complex search algorithms so as to find detailed information that is not available by doing a simple google search.
Attackers use Google dork sto find information about an organization such as sensitive directories, logon pages and information that cannot be found from performing simple google searches.
##### Google Hacking Database
This is an authoritative source that contains information on different google dorking prompts that is found on exploitdb.com

Other search engine footprinting methods include:
1. Advanced search and advanced image search option.
2. Reverse image search.
3. FTP search engines.
4. Analyzing YouTube videos.
5. Using meta search engines (search engine of search engines). (https://startpage.com)
6. Using FTP search engines.
### Footprinting using web services.
We can use web services such as netcraft or censys to discover more information about our target by discovering sub-domains that are used in an organization, sub-domains are usually used to test new technologies or used by different business units. 

**Hot Tip**: We can use the google search `site:<site.com> -inurl:www` to discover subdomains using google dorks.
To discover subdomains we can also use:
1. Amass
2. Sublist3r

### Finding locations
We can use tools such as Google Maps and Google Earth to discover locations of places and potential entrances. We can also visit those particular locations and gather more information through dumpster diving.
### Using social media sites.
We can use social media pages to discover people as they share more information on those platforms.
Some tools worth using include:
1. theHarvester
### Gathering information from Financial services.
We can look through financial reports of target companies that are available on the internet so as to get financial information.
### Footprinting using Job Sites.
When companies are hiring, they usually indicate the technologies they use, this information may be valuable for an attacker as it shows them what technologies that a target uses.
### Using social networks
Attackers use tools such as Sherlock and Social-search to get informationabout a target.
### Website footprinting
We can browse the target website to discover the following information:
1. OS
2. Service version.
3. Sub-directories and parameters.
4. Database name.
5. Technologies used.
This can be done using tools like Burp suite, Wappalyzer and OWASPzap amongst others.

### Footprinting from public documents
We can use tools such as Metagoofill to extract metadata from Word documents and exiftool to extract information from photographs.
### Email footprinting
We can use tools such as Infoga and Mailtrack to track emails that are shared to the user. Emails usually provide information such as the receiver's IP address, mail server and other SMTP related information.
### Footprinting countermeasures
1. Educate people on inforsec awareness.
2. Use pseudonames online.
3. Have policy guiding on how information should be shared.
4. 