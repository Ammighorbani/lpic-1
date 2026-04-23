# Users & Groups

### You can create some user and group in your `OS` to control users privileges

---

### How to see a user information like group id and user id?

```bash
id ammi
```

---

### How to change users password?

```bash
passwd
```

### Note: If you be root user you can change whole users password but if you are a normal user you can change your password only

### If you are root how to change other users password?

```bash
passwd ammi
```

---

### How to add user?

```bash
adduser mamad
```

### Note: After add user you must use passwd to set password on it

### How to see whole users in system?
**You can check this file `/etc/passwd`**

```
mamad:x:1001:1001:mamadh:/home/mamad:/bin/sh
```

#### `mamad`: **Username**
#### `x`: **You can set password**
#### `1001`: **User id**
#### `1001`: **Group id**
#### `mamadh`: **Comment**
#### `/home/mamad`: **Home directory**
#### `/bin/sh`: **Login shell**


### You can create user with different options

```bash
useradd -m -d /var/mamadhacker -c "mamadhacker" -s /bin/bash mamadhacker
```

#### `-m`: **Create home directory**
#### `-d`: **Change home directory path**
#### `-c`: **Write comment**
#### `-s`: **Change shell**

---

### How to change user setting?

```bash
usermod -c "Admin user" mamadhacker
```

#### `-m`: **Create home directory**
#### `-d`: **Change home directory path**
#### `-c`: **Write comment**
#### `-s`: **Change shell**

### How to lock and unlock users?

**Lock**
```bash
usermod -L mamadhacker
```

**Unlock**
```bash
usermod -U mamadhacker
```

### Note: We lock users when someone has leave the company and won't remove it user because it's possible to comeback again or in future need that user, and when you unlock a user you must do a password change to be able

### How to change groups of users?

**primary group**
```bash
usermod -g [group-name] [user]

usermod -g ammi mamadhacker
```

**Aditional groups**
```bash
usermod -G [group-name] [user]

usermod -G sudo mamadhacker
```

### Note: If you use `-g` switch you only change primary group but if you want have multiple groups like you have other groups like sudo and the other you must use `-G` swtich

### It's better to use append when you need your user be in multiple groups

**Append**
```bash
usermod -aG sudo mamadhacker
```

---

### How to delete user?

```bash
userdel mamadhacker
```

### How to delete user with home directory?

```bash
userdel -r mamadhacker
```

### How to remove whole things about specefic user?

```bash
userdel -r -f mamadhacker
```

---

### Where you can see groups?
**You can see your groups in `/etc/group` route**

### How to set password on groups?

```bash
gpasswd group1
```

### How to add groups?

```bash
groupadd [group-id] [group-name]

groupadd 2000 group1
```

### How to change group settings?

#### `-n`: **Change name of group**
```bash
groupmod -n [new-name] [group-name]

groupmod -n newgroup group1
```

#### `-g`: **Change id of group**
```bash
groupmod -g [new-id] [group-name]

groupmod -g 1005 newgroup
```

### How to remove groups?

```bash
groupdel newgroup
```

---

### How to see specefic user information
**You can see specefic user information from /etc/passwd**

```bash
getent passwd ammi
```