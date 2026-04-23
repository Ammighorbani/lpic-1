# Soft & Hard Link

### What is inode?
**On your disk you have some blocked and we call them `sector`, and your `OS` will name each sector with a number and we call them `inode` and for example you have `2GB` disk and your disk have 100000 `inodes` and you have 100001 files you can't save your files on your disk because your files are more than your `inodes` and you can use a file system give you more inodes on your partitions**

---

### How to see inodes?

```bash
df -i

ls -i
```

---

### How to see file system?

```bash
df -T
```

---

### How to see disk usage?

```bash
df -h
```

---

### What is hard link?
**For first you need to know `hard link` won't work on directories, second thing is in `hard link` your inode number is equal with your original file with same or different names, third thing is if you change your original file `permissions` your link file `permissions` will change either**

### How to create hard link?

```bash
ln [source] [destination]

ln mamad asghar
```

### Note: If you make any change on each file that change will modify on same files and they will be think and if you remove your source file your link and your data in your link will be able

---

### What is soft link?
**For first you need to know `soft link` inode number is different with your original file, second thing is if you change your original file `permissions` your link file `permissions` won't change either like `hard link`**

### How to create hard link?

```bash
ln -s [source] [destination]

ln -s mamad asghar
```

```
taghi -> mamad

link     source
```

### Note: If you make any change on each file that change will modify on same files and they will be think but if you remove your source file your link and your data won't be able but if you create a new file with source name again your link will fix but it data will remove and anything you have in your source file you will see in your soft link file

---

### How to remove links?
**You can use `rm` to remove file or use `unlink` to remove your link and it's recommended to use `unlink`**

```bash
unlink [destination]

unlink asghar
```


to remove use rm or unlink