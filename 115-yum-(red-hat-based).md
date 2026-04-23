# yum / dnf

### This is a package manager in red hat based OS

---

### How to `install` packages with apt
**You can install your packages without any wories about dependecys like `rpm`**

```bash
yum install nginx
```

---

### How to change yum repositories?
**You can find and change `yum` repositories configuration file in `/etc/yum.repos.d/` route and there are some files for different things**

---

### First of all you need to update your repositories and list

```bash
yum check-update
```

### Note: `yum check-update` is equal with `apt update`

---

### After updating your need to upgrade your packages
```bash
yum update -y
```

### Note: `yum update` is equal with `apt upgrade`

---

### How to install packages with yum?
```bash
yum install vim
```

### Note: It's possible you need a package like `nginx` and your OS tell you i don't have that package on my repositories and you must add that package repository by yourself

---

### How add custom repository for that package we need?
**You need to read that package documentation and use that package like solution but whole of them will give you a command to add a file in your repositories list directory**

---

### How to remove a package?
```bash
yum remove vim
```

---

### How to search for specefic package?
```bash
yum search vim
```

---

### How to see specefic package dependency list?
```bash
yum deplist vim
```

---

### How to see list of my packages in my repositories?
```bash
yum list
```

---

### How to see which packages are installed on my OS?
```bash
yum list installed
```

---

### You can install `.rpm` packages
**For first you need to install yum-utils**
```bash
yum install yum-utils -y
```

### Note: `yum-utils` add some extra fitture to your `yum` command like `yumdownloader`

#### `--destdir` in `yumdownloader`
**This switch ask you where you want to i download**

```bash
yumdownloader --destdir /root firefox
```

#### `--resolve` in `yumdownloader`
**This switch download that package `.rpm` files you want dependencies either**
```bash
yumdownloader --destdir /root --resolve firefox
```

**Install `.rpm` packages**
```bash
yumdownloader --destdir [PATH] --resolve [package-name]
```

### Note: `yum` point is it will resolve that package you want dependencies automaticlly and make your installation easier, but that worse point is it will only install `.rpm` files

---

### You can see yum command history
```bash
yum history
```

### Note: If you need to monitor `yum` command you can see `/var/log/yum.log` to more information and activities