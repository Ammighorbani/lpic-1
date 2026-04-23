# log

### You can see your OS logs in `/var/log` route and you can find any services logs here

---

### You can see whole authentication logs
**Authenticatiln logs are like login, sudo, invalid password, shell and other things is about authentication you can see them**

```bash
cat /var/log/auth.log
```

---

### You can see apt command logs
**You can see `apt command` logs in `/var/log/apt` route**
```bash
cat /var/log/apt/history.log
```

---

### You can see your kernel logs

```bash
cat /var/log/kernel.log
```

---

### You can see your system logs

```bash
cat /var/log/syslog
```

### Note: In red hat base OS `syslog` name is `messages`
---

### You can see your webserver logs

**If you have nginx each request you receive you can see in `/var/log/nginx/access.log` and each error you have you can see in `/var/log/nginx/error.log`**

```bash
cat /var/log/nginx/access.log
cat /var/log/nginx/error.log
```

---

### You can see your systemd service logs
**Systemd service logs are like `systemctl`**

```bash
journalctl
```

**You can use `-f` to see last logs**
```bash
journalctl -f
```

---

### What is that files are have `gz` extentions?

**After a while time your `OS` come and compress old logs cause base on it disk management and protect to make full of disk storage and we call this operation `log rotation`**

---

### Which types of logs we have?
- **auth log** (login, shell, password change ,...)
- **user log**
- **kernel**
- **corn**
- **demon**
- **mail**
- **local1-local7** (You make logs by yourself)

---

### Which type of logs priority we have?
**Low to High**
- **debug**
- **info**
- **notice**
- **warning**
- **error - err**
- **critical**
- **alert**
- **emergency**

---

### How to generate logs by yourself?
**When you use generate a custom logs you can see it in `/var/log/syslog` route**

**Input**
```bash
logger [text]

logger local1.warning This is my first log
```

**Output**
```bash
Apr 17 23:34:33 mamad ammi: local1.warning this is my first log
```

### Note: We use `logger` command to make log in our scripts for example you have run a script to make a backup of your database and you want to see is your script completed or not

---

### How to rotate logs?
**We use log rotation for our disk management and you can make your changes in `/etc/logrotate.conf`**

### Note: You must change `rotate` parameter value to change how many logs stay in your log file and the other compress

### Note: You can change a rotate file from daily to weekly or monthly and reverse