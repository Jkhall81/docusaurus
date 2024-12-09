---
sidebar_position: 3
---

# Dnsmasq

We could go into our DHCP server and setup PXE boot by registering the ip address of our new FOG server, and providing the filename of our .kpxe file. But we are not going to do that.

We are going to use a DHCP proxy.

When you select network boot from the boot menu of a machine, it will boot up and broadcast over the network looking for an operating system to install. Our DHCP proxy is going to intercept this and send back information on where our FOG server is.
