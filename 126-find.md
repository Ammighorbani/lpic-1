# find

### `find` Command can search in whole of your system where you want to find what you want

```bash
find /
```

**Input**
```bash
find / -name ammi
```

**Output**
```bash
/run/sudo/ts/ammi
/home/ammi
```

---

### You can only search for files

```bash
find / -name ammi -type f
```

---

### You can only search for directories

```bash
find / -name ammi -type d
```

---

### You can search insensetive
**With using `-i`**
```bash
find / -iname ammi 
```

---

### You can search base on file size

```bash
find / -iname ammi -size +100M

find / -iname ammi -size +1G
```

---

### You can search base on file size between two size and make actions

```bash
find / -iname ammi -size +100M -size -200M

find / -iname ammi -size +1G -size -100G

find / -iname ammi -size +1G -size -100G -delete

find / -size +100M -size -1G
```

### Note: when you use `-delete` switch when you find files they will remove after that

---

### You can search base on owner of file

```bash
find / -user ammi
```

---

### You can search base on group of file

```bash
find / -group mysql
```

---

### You can search base on permissions of file

```bash
find / -perm -777
```

---

### You can mix your switchs

```bash
find / -perm -777 -user ammi -group ammi -type f -delete
```

---

### Important note: `find` Command will use a lot of your `CPU` and `RAM` if you only need to find a file and don't do any action on resaults it's better to use [locate](127-locate.md) command