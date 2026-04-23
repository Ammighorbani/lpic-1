# NTP (Network Time Protocol) server

### Here we talk about how to create your own `NTP` server

**You can create `NTP server` with `ntp` package or `chrony` package**

### Note: Always create more than one `NTP server`

---

### `1`- You can check to see do you have ntp package or not?

**Input**
```bash
ntpdate -v pool.ntp.org

ntpdate -v ir.pool.ntp.org
```

**Output**
```bash
15 Apr 02:03:11 ntpdate[3525]: ntpdate 4.2.8p15@1.3728-o Wed Feb 16 17:13:02 UTC 2022 (1)
15 Apr 02:03:13 ntpdate[3525]: step time server 194.225.150.25 offset -5.395659 sec
```

### Note: `ntpdate` command only work when you don't have ntp package on your server

---

### `2`- You need to install ntp package on ntp server and client

```bash
apt update && apt install ntp -y
```

---

### `3`- Check status of ntp service

```bash
systemctl status ntp.service
```

---

### `4`- You can check your NTP queries to your NTP pool

```bash
ntpq -p
```

---

### `5`- You need to change ntp server configuration file
**You can see your `ntp` configuration file in `/etc/ntp.conf` route and change your favourites `ntp pools`**
```bash
pool [NTP-pool] iburst
```

### Note: When you make any change on your `ntp.conf` you need to restart `ntp service`

---

### `6`- You need to change ntp client configuration file
**You can see your `ntp` configuration file in `/etc/ntp.conf` route and comment whole other pools and add this one**
```bash
pool [NTP-server-IP] iburst
```

### Note: When you make any change on your `ntp.conf` you need to restart `ntp service`

---

### `7`- After any change you need to restart ntp.service

```bash
systemctl restart ntp.service
```

---

### `8`- Check again NTP queries

```bash
ntpq -p
```

---

### `9`- Set timezone to Tehran
```bash
timedatectl set-timezone Asia/Tehran
```

---

### `10`- I have been writen automation for NTP server/client
**You can check and use my script [here](ntp.sh)**