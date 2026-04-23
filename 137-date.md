# date

### You can see date with date command

```bash
date
```

---

### How to see date base on UTC

```bash
date -u
```

### Note: It's recommended to always use `UTC` timezone in your `OS` when you want to run it by yourself

---

### You can see year only

**Input**
```bash
date +%Y
```

**Output**
```bash
2026
```

**Input**
```bash
date +%y
```

**Output**
```bash
26
```

---

### You can see month only

**Input**
```bash
date +%m
```

**Output**
```bash
03
```

---

### You can see year only

**Input**
```bash
date +%d
```

**Output**
```bash
31
```

---

### You can create custom date

**Input**
```bash
date +%Y[seperator]%m[seperator]%d[seperator]%H[seperator]%M[seperator]%S

date +%Y-%m-%d-%H:%M:%S
```

**Output**
```bash
2026-04-07-19:25:13
```

### Note: You can choose which seperator you want

---

### You can see unix timestamp

**Input**
```bash
date +%s
```

**Output**
```bash
1775590095
```