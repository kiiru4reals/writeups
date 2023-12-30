### Assetfinder
#### Installation
To install assetfinder we can run the following:

```sh
sudo apt install assetfinder
```

We can also install assetfinder from the following repository [here](https://github.com/tomnomnom/assetfinder.git) 

#### Usage

```sh
assetfinder <domain.com> >> <output_file> 
```

### Amass
### Installation
To install amass, we can run the following command

```sh
sudo apt install amass
```

To enumerate using amass, we can run the following

```sh
amass enum -d <domain.com>
```

### Determining if a host is alive or not
To do this we can automate the process using a tool called Httprobe. This can be installed by running the following command

```sh
sudo apt install httprobe
```

#### Usage
To run this tool, we can do the following
```sh
cat <text_file_with_subdomains> | httprobe -s -p https:443
```

### Automating the enumeration process
To perform this script, we can clone the following repository
https://github.com/Gr1mmie/sumrecon.git

### Additional resources
1. Jason Haddix: YouTube channel.
2. Nahamsec: YouTube channel.
3. 