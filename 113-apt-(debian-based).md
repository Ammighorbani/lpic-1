# apt-get / apt / aptitude

### This is a package manager in debian based OS

---

### How to `install` packages with apt
**You can install your packages without any wories about dependecys like `dpkg`**

**Old version:**
```bash
apt-get install nginx
```
**New version:**
```bash
apt install nginx
```

---

### How to `remove` packages with apt
**You can remove your packages**

**Old version:**
```bash
apt-get remove nginx
```
**New version:**
```bash
apt remove nginx
```

### Note: When you use remove to remove a package your OS will save config files like before and won't remove your config file, for example if you remove your nginx your nginx config file will stay in your OS

---

### How to `fully remove` packages with apt
**You can fully remove your packages**

**Old version:**
```bash
apt-get purge nginx
```
**New version:**
```bash
apt purge nginx
```

### Note: When you use purge whole things about that package will remove from your OS look like you have been never installed that package ever

---

### How to `fully remove` either remove dependencies of that package packages with apt

**Old version:**
```bash
apt-get autoremove nginx
```
**New version:**
```bash
apt autoremove nginx
```

---

### How to give list of apps need to upgrade?
```bash
apt list --upgradable
```
---

### How to upgrade specefic version of a package?
```bash
apt upgrade udev=1.0.10
```

---

### How to upgrade specefic package?
```bash
apt upgrade nginx
```

---

### How to update your repositories and list
```bash
apt update
```

---

### How to upgrade whole packages in system?
```bash
apt upgrade -y
```

### Note: This solution is only recomended when you installed fresh OS never run it on servers where up before you because it's possible you make intrupt like versioning

---

### What is versioning?
**Whole packages on repositories have version it could be that version change diuring the time and packages give some updates and their version change, your `OS` is sensetive to packages version, for example it's possible two years ago you have installed a package version 3 and now you want to update it to version 5 you must read that version guidline to how upgrade your packge without any intrupt because it's possible for example your service get down or more dengress things, we call this subject `versioning`**

### Note: Always be careful about `versioning` of packages

---

### How to change apt repository?
**You can change your `apt` repository in `/etc/apt/sources.list` to any countries you want for example your repo are for iran you can change them to germany, just you need to change `https://[here].archive.ubuntu.com/ubuntu` part of url for example iran repositories are `ir` or germanys are `de` and you need to know that country repo name and change it to that country**

### Note: It's better if you want to make any change on your file do it in `/etc/apt/sources.list.d/` make a file with `.list` extention and make your changes

---

### How to search in repositories for specefic package
```bash
apt-cache search nginx
```

---

### How to see fully information about a package
```bash
apt-cache showpkg nginx
```

---

### How to see a package dependensies
```bash
apt-cache depends nginx
```

---

### You can use `aptitiude` package manager to use more futures
**`aptitiude` is a package manager like `apt` with more futures for example `hold` and `unhold`a pacakge version to don't upgrade and make intrupt like `versioning`**