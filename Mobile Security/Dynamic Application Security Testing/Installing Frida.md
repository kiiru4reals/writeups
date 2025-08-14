### Prerequisites
Installing Frida should be simple using `pip`, to install ensure you have the following on your PC:
1. Python
### Installing with pip
Set up your virtual environment by running the below command
```sh
python -m venv <environment_name>
```
Activate your virtual environment by running the below command:
```sh
source frida/bin/activate
```
This modifies your `$PATH` temporarily so that Python and pip point to the ones inside `frida/` instead of the system ones.
Proceed to install frida using pip by running the below command
```sh
pip install frida
```

You can also choose to use the `--break-system-packages` using by running the below command:
```sh
pip install frida --break-system-packages
```
