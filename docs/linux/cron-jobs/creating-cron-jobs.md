---
sidebar_position: 1
---

# Creating Cron Jobs

Cronjobs are set up to run tasks at scheduled times. Note, you can have cronjobs set up for specific users. So If you log in a system as user X, user X will have it's own cron tab. After you do sudo -i, you will be root, and have a different crontab.

You can access a crontab to add cron jobs with the following command:

```bash
crontab -e
```

You can use nano or vim to create new cronjobs. Below is an example of a cronjob to reboot the system at 5 AM.

```bash
0 5 * * * /sbin/reboot
```

You can read up online about the time convention used for cronjobs. ChatGPT is excellent at creating cronjobs for whatever you want to do.

If you just want to list current cronjobs, and don't need to edit them, you can do that with this command:

```bash
crontab -l
```
