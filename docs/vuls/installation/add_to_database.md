---
sidebar_position: 3
---

# Add Specific OS to database

As an example we have a server here that runs openSuse 15.1. Right out of the box, after populating the Vuls database, Vuls does not have exploit information for this operating system. So we need to add it. We can do this with goval-dictionary.

```bash
goval-dictionary fetch suse 15.1
```

This will grab exploit information for openSuse 15.1. Change the operating system name and version number as needed. For a list of goval-dictionary commands use:

```bash
goval-dictionary --help
```
