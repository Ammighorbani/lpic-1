# dpkg (Debian package manager)

### Note: We are installing package on debian based linux and each OS release are different

---

### You can install mannually packages on your OS
**For first you can find your package on your own `OS` release in [pkgs.org](pkgs.org) website and install your package files and remember you must install that packages have `.deb` extention**

### Note: For server you need to install `amd64` packages

---

### How to install package files on server?
**You can install your file with their link like below**

```bash
wget http://archive.ubuntu.com/ubuntu/pool/man/z/zip/zip_3.0-12build2_amd64.deb
```

---

### How to install files on OS?
**You can use `dpkg` command to install your files on your `OS` manually**

```bash
dpkg -i zip_3.0-12build2_amd64.deb
```

### Note: It's possible that package you are trying to install have some dependency to install and you don't have that dependency on your system and you need to first install dependencys and after that again try to install first package you where tried to install
