# Security

### We will talk about security guides

---

### Check files have suid,guid and sticky bit permission
**It's recommended to check files have these permissions each 3 months and see defference between each one and if you have a new file with these permisson find the creator and know why you have a new one on your OS**

```bash
# suid
find / -perm -u+s

# guid
find / -perm -g+s
```

**Check difference between two files**
```bash
diff suid7jan suid7june
```

### Note: When you setup your OS give this permissions and save in a file out of your server and each 3 months one time check new permissions with your first file

---

### What is nmap?
**You can do port scan on `IP` and `domain` to see which ports of a server is open**

```bash
nmap 192.168.107.158
```

**You can see more information**
```bash
nmap -v 192.168.107.158
```

**You can port scan a range of IPs**
```bash
nmap -v 192.168.107.*

nmap 192.168.107.1-150

nmap 192.168.107.157,158,159

nmap -v 192.168.107.157 192.168.107.158 192.168.107.159
```

**You can exclude an IP**
```bash
nmap -v 192.168.107.* --exclude 192.168.107.158
```

**You can read your IPs of a file**
```bash
nmap -iL ips.txt
```

**You can see destination information like OS**
```bash
nmap -A 192.168.107.158

nmap -O 192.168.107.158
```

**You can check do you have any firewall in your path or no**
```bash
nmap -sA 192.168.107.158

nmap -PN 192.168.107.158
```

**You can see information about specefic port for `TCP`**
```bash
nmap -p T:80 192.168.107.158
```

**You can see information about specefic port for `TCP`**
```bash
nmap -sU 80 192.168.107.158
```

---

### What is ss?
**You can see status of your ports on your OS and it's look like `netstat`**

```bash
ss -a
```

**You can see whole of your `TCP` ports**
```bash
ss -at
```

**You can list your `TCP` ports**
```bash
ss -alt
```

**You can see whole of your `UDP` ports**
```bash
ss -au
```

**You can list your `UDP` ports**
```bash
ss -alu
```

**You can see program name on your port**
```bash
ss -altp
```