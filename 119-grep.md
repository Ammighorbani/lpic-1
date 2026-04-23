# grep

### `grep` Command help you to search in text base files and find your pattern

```bash
grep [pattern] [filename]

grep ssh /etc/ssh/sshd_config
```

### You can use it in pipe

```bash
cat /etc/ssh/sshd_config | grep ssh
```

### How to be case insensitive?

```bash
cat /etc/ssh/sshd_config | grep -i ssh
```

### How to find lines our pattern are not there?

```bash
cat /etc/ssh/sshd_config | grep -v ssh
```

### How can we see some lines after and before our pattern line?

**After**
```bash
cat /etc/ssh/sshd_config | grep -A[number] ssh

cat /etc/ssh/sshd_config | grep -A3 ssh
```

**Before**
```bash
cat /etc/ssh/sshd_config | grep -B[number] ssh

cat /etc/ssh/sshd_config | grep -B3 ssh
```

### You can find specefic file with knowing that file name between lot's of files

```bash
ls /etc | grep ssh
```

### You can do group search in directories
**You can use `-r` switch and it's mean recursive**

```bash
grep -r ssh .
```

### Note: `.` Means search in this route now i am

### You can do glubing with regex
**Glubing is `*`, `?` and...**

```bash
grep -E
```

### Note: We have a command with `egrep` and it's similar