### Create log server

make a rsyslog server and create rsyslog client on the other servers and after that transfer the other servers log to your rsyslog server with syslog protocol



### Here we talk about how to create your own `rsyslog` server

### What is rsyslog server?
**Think about you have one or more servers and you want to have something like fresh and live backup of your logs, You can create another server and transfer your logs on that server, we call `log server` that server have whole the other servers logs and you can create `rsyslog server` with `rsyslog` package**

### Note: Always have backup of your `rsyslog server`

---

### `1`- Install rsyslog package (rsyslog server/client)

```bash
apt update && apt install rsyslog
```

---

### `2`- Enable and start the package (rsyslog server/client)

```bash
systemctl enable rsyslog && systemctl start rsyslog && systemctl status rsyslog
```

---

### `3`- Enable receive logs from network (rsyslog server)
**Open `rsyslog.conf` file in `/etc/rsyslog.conf` route and uncomment one of these two protocol (`TCP/UDP`)**

```bash
module(load="imudp")
input(type="imudp" port="514")

module(load="imtcp")
input(type="imtcp" port="514")
```

### Note: It's recommended to open `TCP` protocol because it's stable and make sure whole packets receive in endpoint successfully

---

### `4`- Create logs directory (rsyslog server)
```bash
mkdir -p /var/log/remote
chmod 755 /var/log/remote
chown -R syslog:root remote/
```

---

### `5`- Save rsyslog clients log in different directories (rsyslog server)
**Create `remote.conf` file in `/etc/rsyslog.d/remote.conf` route and add below configuration in it**

```bash
$template RemoteLogs,"/var/log/remote/%HOSTNAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& stop
```

</br>

### Description of the configuration file
#### **Line 1**
```bash
$template RemoteLogs,"/var/log/remote/%HOSTNAME%/%PROGRAMNAME%.log"
```

#### `$template`: **We are creating a template it's look like we are creating a variable**

#### `RemoteLogs,`: **It's just a random name for our template and we can call it with any different names**

#### `[route]`: **We are telling save our logs in this route with this format**

#### `%HOSTNAME%`: **Host name is about that rsyslog client name sending logs**

#### `%PROGRAMNAME%`: **Program name is about that rsyslog client service name sending logs**

</br>

#### **Line 2**
```bash
*.* ?RemoteLogs
```

#### `*.*`: **Is mean whole logs**

#### `?RemoteLogs`: **Save logs with using RemoteLogs template**

</br>

#### **Line 3**
```bash
& stop
```

#### `& stop`: **Is mean stop to save the logs in the other places base on rsyslog protocol, this command protecting to duplicate the logs in the other routes**

</br>

#### **The result of this configuration file**

```bash
/var/log/remote/
    ├── client1/
    │      ├── sshd.log
    │      ├── kernel.log
    │      └── cron.log
    └── client2/
           ├── sshd.log
           ├── nginx.log
           └── systemd.log

```

---

### `6`- If you have firewall or UFW open TCP port (rsyslog server)
**Firewall**
```bash
firewall-cmd --permanent --add-port=514/tcp
sudo firewall-cmd --reload
```

**UFW**
```bash
ufw allow 514/tcp
```

---

### `7`- Restart rsyslog service (rsyslog server)
```bash
systemctl restart rsyslog
```

---

### `8`- Add a line in your configuration file to send logs (rsyslog client)
**Open `rsyslog.conf` file in `/etc/rsyslog.conf` route and add below configuration to your configuration file**

**TCP**
```bash
*.* @@SERVER-IP:514

*.* @@192.168.107.156:514
```

**UDP**
```bash
*.* @SERVER-IP:514

*.* @192.168.107.156:514
```

---

### `9`- Restart rsyslog service (rsyslog client)
```bash
systemctl restart rsyslog
```

---

### `10`- Test sending the logs (rsyslog client)

```bash
logger "test log from client"
```

---

### `11`- Check logs on rsyslog server 

```bash
ls /var/log/remote/
```

---

### `12`- I have been writen automation for rsyslog server/client
**You can check and use my script [here](rsyslog-server.sh)**



best practice:
put a specefic hard disk for whole logs and use fdisk on your rsyslog server and mount your new disk and mount whole logs to it

when you use this solution if you have another service on your rsyslog server your other services or OS disk won't be full and make any problem only your logs disk will full and if you receive any error about disk storage you can for example make them gzip or remove them base on their date (this part is base on your company policies)




ELK (elasticsearch, logstash, kibana) --> log analize

grafana --> log monitoring