# General things

### Always check some places in your OS

#### `logs`
**Check logs of your servers before you come to see no body have not set unnormal things for you**

#### `Aliases`
**If you are working for first time before anythings use `alias` commands to see recent guy has set any dangerous `aliases` for you or not and your can [read more](129-alias.md) about `alias` command**

#### `services`
**You can [read more](106-service.md) about services to know you don't have unnormal services on your system**

#### `cronjob`
**You can [read more](134-cron-anacron.md) about cronjobs to know you don't have unnormal cronjob on your system**

#### `at`
**You can [read more](135-at.md) about at to know you don't have unnormal job on your system**

---

### What happen when you logout?
**When you log out from your user you have a  file in `/etc/skel` and that file will run for you and whole history you did will remove only on screen not in logs and it just clear your screen, you can change that file and add any things you want to happen when you use logout, for example when user loged in you receive a notification**

---

### You can create your own file and when each user loged in that file will copy for them in their files
**For example you need to share a file between whole users and it's better to put them in `/etc/skel` route and each time someone log in that file will share with him**

---

### What is `man`?
**man or manual page is fully information about each command (it's like --help) and you can see each command man page like this:** `man ls`

---

### **Explain `ammi@mamad:~$` / `root@mamad:~#`:**
1. **ammi**: **Username** <br>
2. **mamad**: **OS name** <br>
3. **~**: **You're in yourself directory** <br>
4. **$**: **You're not super user** <br>
5. **#**: **you're super user**

---

###  **How you can privilege to super user:** **`sudo su -`**
1. **su**: **Super user** <br>
2. **do**: **Do** <br>
3. **su**: **Switch user** <br>
4. **-**: **sooooooooooooooooooooooooooooooooon**

---

### **How to see OS release?**
**`cat /etc/os-release`**

---

### What is `d` at the end of some services?
**sometimes you see `d` at the end of some services like `sshd` that `d` means `demon` we call `demon` that process's are runing in background and we can't see them and your system is up base on demon process's and you can do everything with `demon` process's like `stop`, `start`, `restart`, `status`, `enable` and `disable` with [systemctl](104-systemctl.md)**

---

### What is defferent between `ssh` and `sshd`?
**When you want to create a `ssh` connection to a server you will use `ssh` service and that server you are connected use `sshd` if that server connect to you with ssh palces will change**

---

### We can brodcast a message with `wall` command to all logedin users
**We can send a brodcast message to all logedin users with `wall` command for sensetinve times like when you want reboot server and you must inform others cause it's possible they are doing sensetive operation and you musn't make distrub their operation**

**Input:**
```bash
wall going for reboot 10 min later
```

**Output:**
```bash
Broadcast message from root@mamad (pts/3) (Wed Mar  4 21:30:52 2026):

going for reboot 10 min later
```

---

### How we can inform which users are logedin?

**We can use `w` command to inform some information about which users are loged in and somethings like this information**

**Input:**

```bash
w
```

**Output:**

```bash
21:40:31 up  1:07,  3 users,  load average: 0.10, 0.11, 0.04
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
ammi     pts/0    192.168.107.1    20:33    1:07m  0.24s  0.04s sshd: ammi [priv]
ammi     pts/1    192.168.107.1    20:33    1.00s  0.01s  0.23s sudo su -
root     pts/3    tmux(1365).%1    20:33    1.00s  0.02s  0.00s w
```

---

### You can see time with `date` command
```bash
date
```

---

### How to see our disk partions?
```bash
lsblk
```

---

### What is grub file?
**`grub` will up your kernel and if you grub file take any issues you `OS` won't comes up you can see your grub file with this name `grub.cfg` in `/boot/grub/grub.cfg` route and always have `backup` of your `OS` grub file**

### Note: Most important thing in your grub file is your os unique uuid
[read more about grub](109-grub.md)

---

### Where is your commands in linux?
**For first i need to let you know you can create your own commands and with this command you can see your commands route and we call that route `PATH` when you want to create a command you need to put your code in these `paths`**

```bash
echo $PATH
```

### Note: `bin` directory is for something like daily command look like `ls` or `cd` but `sbin` is for harmfull and dangerous commands like `fdisk`

---

### Shared library & static library
**It's possible your `services` use same library and we call that same library in linux `shared library` and you can [read more](111-ldd.md) how to find what is our services shared library and you can create your own `shared library`**

**sometimes some services don't use `shared library` and have their own library in their own package and we call it `static library`**

---

### How you can install manually package on your debian base OS?
**You can use `pkgs.org` website to install packages on your linux and each linux family solution is defferent by the others you can [read more](112-dpkg.md) about how to install manually package**

---

### How you can install manually package on your red hat base OS?
**You can use `pkgs.org` website to install packages on your linux and each linux family solution is defferent by the others you can [read more](114-rpm.md) about how to install manually package**

---

### How to install packages automatically on your debian base OS?
**you can use `apt` command on your `OS` and you can [reed more](113-apt.md) about `apt` command**

### Note: Always be careful about versioning of packages

---

### How to install packages automatically on your red hat base OS?
**you can use `yum` command on your `OS` and you can [reed more](115-yum.md) about `yum` command**

### Note: Always be careful about versioning of packages

---

### Never use `do-release-upgrade` command
**This command will connect to repositories and update your `OS` for example you are in ubuntu 22.04 and now we have 24.04 and if you upgrade your `OS` it's possible you signed your fire paper :)**

### Note: If you needed to upgrade your OS is recomended you download OS file and migrate it don't upgrade it

---

### You can see `yum` command history
```bash
yum history
```

### Note: If you need to monitor `yum` command you can see `/var/log/yum.log` to more information and activities

**[read more](115-yum-(red-hat-based).md) about `yum`**