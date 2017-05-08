# EDGI DevOps Tools

The purpose of this repository is to manage and provision tools specific
tools that EDGI uses. These tools currently include:

- MeatSpac.es Chat

## Usage

```
# Confirm Ruby 2.1+
$~ ruby --version
ruby 2.3.3p222

# Confirm server in question is reachable, either via public DNS record,
# or `/etc/hosts` edit.
$~ ping meatspaces.nodescription.net
PING meatspaces.nodescription.net (162.243.212.178) 56(84) bytes of data.
64 bytes from meatspaces.nodescription.net (162.243.212.178): icmp_seq=1 ttl=51 time=38.0 ms
```

```
make setup
make bootstrap meatspace.example.com
```
