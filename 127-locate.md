# locate

### locate command in search and find files is look like [find](126-find.md) command

---

### It's possible you need to install it
**If your `OS` older than ubuntu 22.04**

```bash
apt install mlocate -y
```

**If your `OS` newer than ubuntu 22.04**

```bash
apt install plocate -y
```

---

### How to find a file with locate?

```bash
locate [route] [patter]

locate / ammi
```

---

### What to do if you make new file and you can't find it with locate?
**When you create a new file right now and you need to find it you need to update your locate command database to find your new file**

```bash
updatedb
```