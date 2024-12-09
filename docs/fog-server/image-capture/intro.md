---
sidebar_position: 1
---

# Image Capture

Fog works basically the same way as Clonezilla. So we can set up an operating machine, for example Linux Mint, just how we want and then FOG will make an image based on that system. It will grab all configuration details of the system it captures an image from.

## Create a New Image

In a browser navigate to your web management console. It will be located at [IP-Address]/fog/management. Your default user credentials will work if you haven't changed them yet. It's a good idea to change them.

Once in the console go to the picture icon at the top, and select `Create New Image` from the sidebar.

Add an Image name and description. Keep `Storage Group` as default. Select the correct `Operating System` type. For `Image Type` we want Single Disk - Resizeable, and `Partition` Everything. Click the `Add` button at the bottom.

## Register a Host

Now you need to network boot the machine with the operating system that you want to capture an image from. This can be a virtual machine or a regular machine. Network boot it and select the full registration option from the menu. You have three seconds to move up and down in the menu before the menu times out.

Follow the prompt and at the end select N when it asks if you want to deploy an image now.
