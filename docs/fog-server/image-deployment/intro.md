---
sidebar_position: 1
---

# Image Deployment

This is super easy. Network boot a machine you want to reimage. In the FOG server boot menu select `Deploy Image` and follow the prompt.

## Troubleshooting

If the machine isn't booting into the FOG Server make sure the machine is on the same subnet as the FOG Server. If you are using a virtual machine, make sure it is in bridged network mode. If you are using NAT network mode then you would have to set up a dhcp-range in the ltsp.conf we made earlier.
