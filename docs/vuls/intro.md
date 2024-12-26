---
sidebar_position: 1
---

# Vuls

Vuls is an agentless, open-source, vulnerability scanner for Linux. Agentless means that this scanner does not use the server / agent design that many vulnerability scanners use. This design involves having the scanner / vulnerability database hosted on a server machine, and then installing agent software on each machine that you want to be able to scan or monitor. Because Vuls is agentless it is much easier to install and use.

If you are interested in reading more about Vuls it's site and documentation can be found [here](https://vuls.io/en/).

## How Vuls Works

Basically all this does is the scanner is set up to access a machine that you want to scan. During the scanning process the scanner accesses the target machine via SSH and gets details about the operating system version, and the versions of packages / software that the machine is using. It then checks those versions against vulnerability databases to see if there any any known exploits that can be executed against the operating system or software that the target machine is running. The scanner will then generate a report of known exploits found, and if there is a fix available. If a fix is available to the patch / update version is given that fixes the issue.
