---
sidebar_position: 4
---

# Install Dnsmasq

Dnsmasq does DNS stuff. Hence the name, but it also does DHCP stuff. We don't care about DNS stuff. Our DNS needs are covered. We are going to turn off Dnsmasq's DNS functionality.

## Install

```bash
sudo -i
apt update
apt install dnsmasq
```

If you are a wildman you can install dnsmasq without updating first.

### Port 53

After installation if you try to start dnsmasq:

```bash
systemctl start dnsmasq
```

It won't start. It will give you an error message about something else already running on port 53. Port 53 handles DNS, and our system should already have a service running that handles DNS. That service is systemd-resolved. You can check them both if you want.

```bash
systemctl status dnsmasq
systemctl status systemd-resolved
```

## ltsp.conf

Now we need to set up a .conf file for Dnsmasq to do what we want.

We need to create a ltsp.conf file in the /etc/dnsmasq.d directory.

```bash
nano /etc/dnsmasq.d/ltsp.conf
```

In that file we need to put the following:

```
# Don't function as a DNS server:
port=0

# Log lots of extra information about DHCP transactions.
log-dhcp

# Set the root directory for files available via FTP.
tftp-root=/tftpboot

# The boot filename, Server name, Server Ip Address
dhcp-boot=undionly.kpxe,,<fog_server_IP>

# Disable re-use of the DHCP servername and filename fields as extra
# option space. That's to avoid confusing some old or broken DHCP clients.
dhcp-no-override

# inspect the vendor class string and match the text to set the tag
dhcp-vendorclass=BIOS,PXEClient:Arch:00000
dhcp-vendorclass=UEFI32,PXEClient:Arch:00006
dhcp-vendorclass=UEFI,PXEClient:Arch:00007
dhcp-vendorclass=UEFI64,PXEClient:Arch:00009

# Set the boot file name based on the matching tag from the vendor class (above)
dhcp-boot=net:UEFI32,i386-efi/ipxe.efi,,<fog_server_IP>
dhcp-boot=net:UEFI,ipxe.efi,,<fog_server_IP>
dhcp-boot=net:UEFI64,ipxe.efi,,<fog_server_IP>

# PXE menu.  The first part is the text displayed to the user.  The second is the timeout, in seconds.
pxe-prompt="Booting FOG Client", 1

# The known types are x86PC, PC98, IA64_EFI, Alpha, Arc_x86,
# Intel_Lean_Client, IA32_EFI, BC_EFI, Xscale_EFI and X86-64_EFI
# This option is first and will be the default if there is no input from the user.
pxe-service=X86PC, "Boot to FOG", undionly.kpxe
pxe-service=X86-64_EFI, "Boot to FOG UEFI", ipxe.efi
pxe-service=BC_EFI, "Boot to FOG UEFI PXE-BC", ipxe.efi

dhcp-range=<fog_server_IP>,proxy
```

Replace fog_server_IP with your fog server ip address.

## Restart and Enable the service

Now Dnsmasq should stay off port 53.

```bash
systemctl restart dnsmasq
systemctl enable dnsmasq
```

If you want to double check that dnsmasq is up and running, you can use one of the two commands.

```bash
systemctl status dnsmasq
ps aux | grep dnsmasq
```

The enable command makes sure that dnsmasq is started everytime the machine boots.

## Subnets

In ourcase the FOG Server and machines we need to reimage are on the same subnet, so we don't need a dhcp-range at the end of the ltsp.conf file. If we had machines on other subnets then we would need to listen the range that those machines fall in in order for network booting to work.
