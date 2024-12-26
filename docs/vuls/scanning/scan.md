---
sidebar_position: 1
---

# Scan with Vuls

There are two main options for running scans with Vuls: running a local scan or a remote scan. Either way you need to set up a config.TOML file in the vulsctl folder to run a scan.

## Local Scan

To create a config.TOML for a local scan. Use the following commands:

```bash
nano config.TOML

[servers]

[servers.localhost]
host = "localhost"
port = "local"

```

under [servers] you list what machines you have set up to scan. You can name them whatever you want, but you need to use the convention [servers.name]. So, for example, if you want to set up a machine called staging, you would name it [servers.staging], and then list the machines details below that.

### Run Your Scan

With your config.TOML setup, you are now ready to run a scan. Before the scan you can make sure everything is setup correctly with the configtest command:

```bash
vuls configtest localhost
```

If this doesn't give you any error messages then you are ready to scan.

```bash
vuls scan localhost
```

## Remote Scan

For a remote scan you just need to add another machine to your config.TOML. So under [servers] add another machine.

```bash
nano config.TOML

[servers.staging]
host = "192.168.0.0"
user = "user"
port = "22"
keyPath = "/root/.ssh/id_rsa"
scanMode = ["fast"]
```

### Setup SSH Key

For the remote scan to work, you need to set up an SSH key between the machine hosting the Vuls scanner, and the machine being scanned.

On the machine with Vuls installed, open a terminal and execute the following command to create an SSH key:

```bash
ssh-keygen -t rsa
```

You can hit enter to accept the default location (recommended), and leave the passphrase blank. Now your key is up on the host machine. Next execute the following command to copy it over to the target machine:

```bash
ssh-copy-id user@server_IP
```

You will then be prompted to enter a password. After that everything is set up to scan.

## Scan

To make sure everything is set up correctly, run the following command:

```bash
vuls configtest [name_of_machine]
```

Then run your scan the same way we did for the local scan.

```bash
vuls scan staging
```
