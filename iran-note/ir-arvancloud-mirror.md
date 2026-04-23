# How to change mirror repo to iranian repo and install packages while net is shutdown

### I have writen this notes when we were in war in iran and we don't have any access to internet, but i found a way to install my packages on my ubuntu

### You can use [Arvalcloud miror repositries](https://www.arvancloud.ir/fa/dev/linux-repository) to change your mirror repositories in `/etc/apt/sources.list` file

### You need to change your miror repositories

```bash
sed -i 's/[your-repo].archive.ubuntu.com/mirror.arvancloud.ir/g' /etc/apt/sources.list
```

### Now yor mirror repositories changed but if you try to install package you will receive error because your linux can't send request to `security.ubuntu.com` and you need to remove it

```bash
cat /etc/apt/sources.list | grep mirror.arvancloud.ir > /etc/apt/sources.list
```

### Now you can install your packages

### One liner commands

```bash
sed -i 's/[your-repo].archive.ubuntu.com/mirror.arvancloud.ir/g' /etc/apt/sources.list && cat /etc/apt/sources.list | grep mirror.arvancloud.ir > /etc/apt/sources.list.back && cat /etc/apt/sources.list.back > /etc/apt/sources.list && rm /etc/apt/sources.list.back && cat /etc/apt/sources.list
```

#### Author [Ammighorbani](https://github.com/Ammighorbani/)