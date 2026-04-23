# locale

### You can change your system language and languag standards

```bash
locales
```

---

### How to change language?
```bash
dpkg-reconfigure locales
```

### Note: One time you need to logout and login again to apply new configuration

---

### You can change each option of locale
```bash
LANG=C
```

### Note: It's recommended to put on `C` language standard

---

### You can use LC_ALL
**If you use `LC_ALL` whole of your languages standard will set on that language**
```bash
LC_ALL=en_US.UTF-8
```

### Note: This way is temporary and you must use `dpkg-reconfigure locales` to permanent it

---

### You can see your OS whole character encoding support

```bash
iconv -l
```

---

### You can convert your files encoding from one of encoding to another

```bash
iconv -f ASCII -t UTF-8
```

#### `-f`: **From which encoding**
#### `-t `: **To which encoding**