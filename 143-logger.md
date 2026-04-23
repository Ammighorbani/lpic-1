# logger

### You can to generate logs by yourself?
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