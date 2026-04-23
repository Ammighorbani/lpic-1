# Permissions

### Each flies or directories can to contain 3 difference `permissions` with these names, `Read` for reading, `Write` for writing and `Execute` for Executing file and directory and each file and directory have an `Owner` and which `Groups` and `Other` can access to it

### Note: We can make different permissions for `Owner`, `Group` and `Other` and you need to be carefull when you want to change permissions

---

### Parts of permissions
```bash
[d, l, -][1-3, owner][1-3, group][1-3, other]

drwxr-xr-x
```

**First part**
#### `d`: **Directory**
#### `l`: **Link**
#### `-`: **It's mean file**

**Other part**
#### `r`: **Read**
#### `w`: **Write**
#### `x`: **Execute**
#### `-`: **It's mean don't have any permissions**

```bash
root root
```

### Note: First name is owner name and second name is group name

---

### How to change permissions?
**You can change permissions with `chmod` command**

**Add permissions to `Owner`**
```bash
chmod u+x mamad
```

#### `u`: **Changing owner permissions**
#### `x`: **Adding execution permission**

**Before**
```bash
-rw-r--r--  1 root root     0 Mar 18 01:47 mamad
```

**After**
```bash
-rwxr--r--  1 root root     0 Mar 18 01:47 mamad*
```

**Remove permission for `Owner`**
```bash
chmod u-rx mamad
```

**Before**
```bash
-rwxr--r--  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
--w-r--r--  1 root root     0 Mar 18 01:47 mamad
```

---

**Add permissions to `Group`**

```bash
chmod g+rwx mamad
```

#### `g`: **Changing group permissions**

**Before**
```bash
--w-r--r--  1 root root     0 Mar 18 01:47 mamad
```

**After**
```bash
--w-rwxr--  1 root root     0 Mar 18 01:47 mamad*
```

**Remove permission for `Group`**

```bash
chmod g-rwx mamad
```

**Before**
```bash
--w-rwxr--  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
--w-rw-r--  1 root root     0 Mar 18 01:47 mamad
```

---

**Add permissions to `Other`**

```bash
chmod o+rwx mamad
```

#### `o`: **Changing other permissions**

**Before**
```bash
--w-rw-r--  1 root root     0 Mar 18 01:47 mamad
```

**After**
```bash
--w-rw-rwx  1 root root     0 Mar 18 01:47 mamad*
```

**Remove permission for `Other`**

```bash
chmod o-rw mamad
```

**Before**
```bash
--w-rw-rwx  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
--w-rw---x  1 root root     0 Mar 18 01:47 mamad*
```

---

**Change permissions for `all`**

```bash
chmod a=rw mamad
```

#### `a`: **Changing all permissions**

**Before**
```bash
--w-rw-rwx  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
-rw-rw-rw-  1 root root     0 Mar 18 01:47 mamad
```

---

### You can change permissions in one line

```bash
chmod u+rw,g+r,o-r mamad
```

---

### You can change permissions with numbers

```bash
- - -   - - -   - - -

4 2 1   4 2 1   4 2 1
```

**If you need `rw-r----x`**
```bash
chmod 641 mamad
```

#### `4`: **Read**
#### `2`: **Write**
#### `1`: **Execute**

### Note: If you need read and write you can sum numbers

---

### If you have a directory and you have some files in it you can change whole files in directory and directory either permissions if you want

```bash
chmod -R 777 dir1/
```

### Note: If you don't use `-R` switch that files permissions won't change in your directory

---

### sticky bit
**If you use sticky bit on file or directory never ever no one can't remove someone files and directories and only owner of file or directory can remove it, but it's possible to others can read and write but only owner can remove it unless root, root can do anythings**

```bash
ll / | grep tmp

drwxrwxrw[t]
```

### suid
**Each user can run it with that user access and if you run it with your user you can only change your password base on your access and if root run that command can change it password and other users base on it access to system**
```bash
which passwd && ls -l /usr/bin/passwd

-rw[s]r-xr-x
```

### Note: With `suid` you can use a command with two different permissions and base on owner of file

### guid
**If you want to do something like `suid` but base on group name you can do it with `guid` and it work base on group of file**

### Note: If you give `suid` and `guid` permissions on directories it will set but it won't work because you won't never run a directory

### How to set `sticky bit`, `suid` and `guid`?
**You can only set these three permissions with it's numbers**

```bash
suid   guid   sticky bit

  4      2         1
```

**For `suid`**
```bash
chmod 4755 mamad
```

**Befor**
```bash
-rwxr-xr-x  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
-rwsr-xr-x  1 root root     0 Mar 18 01:47 mamad*
```

### Note: If you have execute permission and have suid either you will see small `s` but if you only have suid you will only see capital `S`

**For `guid`**
```bash
chmod 2745 mamad
```

**Befor**
```bash
-rwxr--r-x  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
-rwxr-Sr-x  1 root root     0 Mar 18 01:47 mamad*
```

### Note: If you have execute permission and have guid either you will see small `s` but if you only have guid you will only see capital `S`

**For `sticky bit`**
```bash
chmod 1754 mamad
```

**Befor**
```bash
-rwxr-xr--  1 root root     0 Mar 18 01:47 mamad*
```

**After**
```bash
-rwsr-xr-T  1 root root     0 Mar 18 01:47 mamad*
```

### Note: If you have execute permission and have sticky bit either you will see small `t` but if you only have sticky bit you will only see capital `T`

---

### How to change user and group of file and directory?

```bash
chown [owner]:[group] mamad

chown ammi:root mamad

chown root: mamad

chown -R ammi:root dir1/
```

### Note: If you need to change childs of directory you need to use `-R`

---

### You can only change the group of file

```bash
chgrp root mamad
```

---

### How to see whole groups with members?
**You can see whole groups in `/etc/group`**