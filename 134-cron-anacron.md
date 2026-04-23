# cron & anacron

### You can schedule your jobs and tasks on your `OS` and if you are on desktop you can use `anacron` and if you are on server you must use `cron`, in `cron` you can schedule things from 1 min to any other time you want

### `Important note`: In `cron` if you schedule a job for 2AM and you turn of your server before that time and again you turn on your server after that time, your job won't start after that time but in `anacron` if you do something like this, your job will run and in `cron` each user can make a `cron` but in `anacron` only `root` user can make it

---

### How to make a cron?
**You can make a cron job in `/etc/crontab` route**

```bash
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
```

#### `Frist *`: **Is for minute [0-59]**
#### `Second *`: **Is for hour [0-23]**
#### `Third *`: **Is for day [1-31]**
#### `Fourth *`: **Is for month [1-12]**
#### `Fifth *`: **Is for day of week [0-7]**

**Example**
```bash
50 01 * * * root reboot
```

---

### You can say in minute 5 and 10 and 15

```bash
5,10,15 01 * * * root /root/scripts/hi.sh
```

---

### You can say a range of number

```bash
5-15 02 * * *  root echo "salam"
```

---

### You can say each 2 minutes repeat

```bash
*/2 * * * * root ping 8.8.8.8
```

### Note: `*/2` is mean 60/2 and it's equal with 30 times in minute

---

### You can say after an event like reboot do specefic job

```bash
@reboot root /root/scripts/reboot-notife.sh
```

```bash
@daily root echo "salam"
```

```bash
@weekly root reboot
```

```bash
@monthly root ping 8.8.8.8
```

```bash
@yearly root cat /etc/passwd | ammi > user
```

### Note: You can do these things in their specefi file in `/etc/cron*` route

---

### You can make cron job for user specefic

```bash
crontab -e
```

### Note: First time you use this command it will ask you want to run it with which editor and you choose `vim.tiny`

---

### When a cron job run you can see it log
**If a `cronjob` runed for you, you can see it logs in `/var/log/syslog`**

### Note: You can change your cron log file

---

### How to change cron log file?

```bash
----------------------------
```

---

### How to give access from users to don't make cron and only specefic user can write cron job?

**For first you need to create a file in `/etc` with `cron.allow` name**

```bash
vim /etc/cron.allow
```

**After you created this file you can write that username you want to have access to write cron for you**

```bash
root
```

### Note: After you make this file whole users access will remove from cron and only that user can create cron job you wroted it name in that file

---

### How to give access from specefic user to don't make cron?

**For first you need to create a file in `/etc` with `cron.deny` name**

```bash
vim /etc/cron.deny
```

**After you created this file you can write that username you want to don't have access to write cron for you**

```bash
ammi
```

### Note: After you make this file that specefic users access will remove from cron and they can't create cron job