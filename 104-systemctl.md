# systemctl

### How to change default runlevel?
**You can change your default system runlevel with `systemctl` command like below**

#### Note: You need to find your specefic runlevel file name
**For example `runlevel 5` file name is `graphical.target`**

```bash
systemctl set-default graphical.target
```

**Also you can see your default runlevel like below**
```bash
systemctl get-default
```

---

### You can `see` your system services status with `systemctl`

```bash
systemctl status [service-name]
```

---

### You can `stop` your system services with `systemctl`

```bash
systemctl stop [service-name]
```
---

### You can `start` your system services with `systemctl`

```bash
systemctl start [service-name]
```

---

### You can `restart` your system services with `systemctl`

```bash
systemctl restart [service-name]
```

---

### Also you can `disable` your system services with `systemctl`

```bash
systemctl disable [service-name]
```

---

### Also you can `enable` your system services with `systemctl`

```bash
systemctl enable [service-name]
```

---

### Also you can `reload` your system services with `systemctl`

```bash
systemctl reload [service-name]
```

---

### What is the defferent between `restart` and `reload`?
**If you `restart` a service whole of service one time will stop and start again and if someone or something using that service you have restarted will drop, but if you use `reload` whole of won't stop and start again, service will check `configuration` files and if you changed something that changes will be applied**

---

### What is defferent between `disable/enable` and `stop/start`?
**`disable`**: **When you `stop` a service after a reboot that service will be up but if you disable a service if god come that service won't come up** <br><br>
**`enable`**:**When you `disable` your service you must first `enable` is and then after that you can `start` that service**

---

### You can ask about services

#### Active and inactive
**Input:**
```bash
systemctl is-active [service-name]
```
**Output:**
```bash
active / inactive
```

---

#### Enable and disable
**Input:**
```bash
systemctl is-enabled [service-name]
```
**Output:**
```bash
enabled / disabled
```

---

### You can see whole services with `systemctl`
```bash
systemctl
```