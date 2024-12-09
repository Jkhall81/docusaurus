---
sidebar_position: 2
---

# Select Host

Now back in the web management console go to host management. It will be the computer monitor icon at the top. Select `List All Hosts` from the sidebar.

Find the host you just registered and make sure the Assigned Image is the one you created earlier.

Next to the `Assigned Image` name there should be a `Task` Column with four icons.

Click on the Orange Arrow that is facing up. Then click the blue `Task` button at the bottom.

## Image Capture

Now back at your host machine, the machine with the operating system you want to make an image from, network boot that bad boy again. It should automatically start the image capture process. Sometimes this will error out the first time with a message about partition resizing. If it does this just try network boot the machine again and it should work the second time.

## Verify Image Capture

After it is done go back to your web management console, go to the Images section, and select `List All Images` from the sidebar. Your new Image should be listed and it should show how large it is. 13.58 GiB for example. If the listed size is not 0 then you have a new image to deploy.
