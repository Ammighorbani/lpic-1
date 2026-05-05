# timedatectl

### You can see your OS time and date information

```bash
timedatectl
```

---

### You can change your own user timezone

```bash
tzselect
```

### Note: After you confirmed you time and date setting you must put that one liner command in your .profile to permanent

---

### How to change global time in your OS?

### `First method`
**You can use `timedatectl` command**
```bash
timedatectl set-timezone Asia/Tehran
```

### `second method`
**For first you can see your time zone file in `/usr/share/zoneinfo` and you can change your default time zone in `/etc/localtime` route and you have a soft link, if you change it link you can change your global time zone**

**First of all you need to unlink file**
```bash
unlink /etc/localtime
```

**After you find your favourite time zone route you need to link again your file**
```bash
ln -s /usr/share/zoneinfo/Asia/Tehran /etc/localtime
```

**Now your OS time have changed and you can check it**
```bash
cat /etc/timezone
```

### Note: When you use `First method` actually it do `Second method` steps for you

---

### `Important Note`
### Cron job time is base on which time on your system?

**When you make a job in your cron tab, your system is base on your `/etc/timezone`**

---

### You can give time from your hard ware
**We don't use this command right now but in a long time ago peoples give their time from their `BIOS`**
```bash
hwclock
```

---

### If you have more that one server you need to configure and think their time
**When you have more than one server you must to configure and think their time to work with each other without any problem and issues, you can do it with `NTP server` and [read more]() about `NTP server`**