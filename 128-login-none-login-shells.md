# Shells

### We have to different shells, `login shell` and `none login shell`
**When you use ssh you are using `login shells` and when you use `bash` command or open your graphical `OS` terminal you are using `none login shells`**

---

### Where is login shells setting?
**You can see your `login shell` settings in `/etc/profile`**

---

### Where you can add custom files to yoru users?
**`/etc/profile.d/`**

### Note: you can use this route to put your scripts here and for example after each users login you receive a notification or show date and other things you need

---

### How to change login shell settings for specefic user?
**Each user have a `.profile` file and you can make your changes there**

---

### Where is none login shells settings?
**Your global `none login shell` settings are in `/etc/bash.bashrc` route**

---

### How to change none login shell settings for specefic user?
**Your `none login shell` settings are in `.bashrc` route**

---

### If you make any change on your settings files you need to one time logout and login again to reload your files or use `source .bashrc` command or use `. .bashrc`

### Note: `. = source` 