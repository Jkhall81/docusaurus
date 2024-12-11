---
sidebar_position: 3
---

# Create Users

All of these commands are going to executed in the terminal. To open a terminal session on most debian based systems you can execute:

```bash
ctrl + alt + t
```

## Create a New User

You can create a new user using:

```bash
sudo useradd -m [userName]
```

The -m flag will create a home directory on the machine for the user. Note that after executing this command you will have a user with a home directory, but no password. So this user will not be able to log in.

Read up on other flags you can use on the useradd Man page.

```bash
man useradd
```

### Add a Password

```bash
sudo passwd [userName]
```

After this command you will be prompted to enter a password twice. There are no real default requirements for passwords, so easy to guess passwords can be used. Once a user has been created and a password given this user will show up as a login option when the operating system boots.

## Create a User Without a Password

If you want a user, for example an agent account, that can log in without a password, you have to create a new user, and then delete it's password. So, for example, if you want an agent user that can log in without providing a password you would use the following commands:

```bash
sudo -i
useradd -m agent
passwd -d agent
```

sudo -i will give you root privileges, so you don't need to type sudo and enter a password for every command. So now after the operating system boots up, there will be an agent user that you can log into without providing a password.

## Give a User Admin / Sudo Privileges

```bash
sudo usermod -aG sudo [userName]
```

## Check User Priveleges

```bash
groups [userName]
```
