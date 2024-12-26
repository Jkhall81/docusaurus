---
sidebar_position: 2
---

# Install Vuls

There are several different options available to install vuls. In their documentation the vuls team recommends using docker to install the scanner. A list of all installation options can be found [here](https://vuls.io/docs/en/install-with-vulsctl.html).

Instead of using Docker I just installed the scanner directly on the host machine, since there are less steps involved in doing this.

## Get Vuls

First we need to pull the code from Vuls git repo. They are not fancy enough to have a self hosted download package. To pull the code from github execute the following command:

```bash
git clone https://github.com/vulsio/vulsctl.git
cd vulsctl
```

These commands are for installing Vuls on a linux machine.

Take a look at the folder structure of the scanner if you are interested. We are interested in the install-host folder:

```bash
ls
cd install-host
```

Once you are in the install-host folder, we can start installing the scanner.

```bash
sudo -i
bash install.sh
```

I like using sudo -i so that I only have to type a password in once, instead of every time a command needs to be run. This command will install the scanner, and should be fairly quick.

Next we have to populate our sqlite database with exploit information. This will take a decent chunk of time:

```bash
bash update-all.sh
```

Finally, if you want to make sure Vuls is using the latest version, you can run the following command:

```bash
bash upgrade.sh
```

Now our database should be populated, but that doesn't mean we are ready to scan. You might have to load definitions / exploits for a specific operating system in the future.
