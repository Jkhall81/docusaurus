---
sidebar_position: 2
---

# Install Fog

These instructions will be for installing FOG on Ubuntu, but the process on other Linux distros will be fairly similiar.

## Getting FOG

```bash
sudo -i
cd /
git clone https://github.com/FOGProject/fogproject.git
cd fogproject
```

Use sudo -i to gain root and then you won't have to bother with typing in a password everytime you need to do something.
You can put this where ever you want, but putting it in your root folder ('/') will make it easy to find. After cloning the repo cd into it.

## Running the installer

This comes with a handy installtion bash script to set everything up. The installation script is located in the bin folder.

```bash
cd bin
./installfog.sh
```

The installation prompts are fairly straight forward.

- We want a Normal installation
- Do not change the default network
- We will be using Dnsmasq, so we will not setup a DHCP server address
- We would not like DHCP to handle DNS
- We do not want FOG to provide DHCP services
- No to HTTPS
- A final Y to continue with the installation

### Web Client

After the installation it will provide a url:

http://[ip-address]/fog/management

The IP address here will be that of the Ubuntu server you have installed FOG on, in case you haven't looked that up yet.

Open up that url in a browser and click the `Install/Update Now` button.

## Where You Are Now

Follow the rest of the prompts in the terminal. It will give me a username and password to log into the web management client. Right now you have FOG installed, but you have no images. Also PXE booting machines on the LAN will not work because we have not set up Dnsmasq yet.
