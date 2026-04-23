### What is grub file?
**`grub` will up your kernel and if you grub file take any issues you `OS` won't comes up you can see your grub file with this name `grub.cfg` in `/boot/grub/grub.cfg` route and always have `backup` of your `OS` grub file**

### Note: Most important thing in your grub file is your os unique uuid

---

### What will happen when your grub file have some issues and you don't have a backup?
**If your grub file (`grub.cfg`) have some problem and you don't have any backup you can recover it and regenerate it**

```bash
grub-mkconfig
```

### Note: This code will generate your grub file config again and you can fix your `grub.cfg` file

---

### How to make change on you grub?
**we have a file in `/etc/default/grub` route and you can make your changes on your grub buy editing this file and after that you need to use `update-grub` to confirm you updates and your grub will scan this file and applie your changes on your grub**

**You can save your grub config file like below**
```bash
grub-mkconfig -o /boot/grub/grubbk.cfg
```

### Note: recomended to do it always you installed new `OS` and have it in your starter codes and automations

---

