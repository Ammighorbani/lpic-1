# disk partitioning

### You can change your disk format and patition in linux

---

### We have 2 disk technology
#### `1`: **MBR**
#### `2`: **GPT**

### Note: Today we are using `GPT` technology

---

### How `MBR` working?
**In `MBR` disk technology we have a data with `metadata` name at start of disk and in this data we had some information like our partitions start from which sector and end on which sector but we had a problem, when you have any issue like break or magnetic field and some other things like physical issues on that part of hard, your `metadata` won't be accessable and after that whole of your disk will be useless and you can't create more than `4` partitions with `2TB` limit**

---

### We have 2 different models of partitions in MBR

#### `Primary`: **In MBR technology you can create 4 primary partitons and primary partiotions are like normal partitions or create last one extended**
#### `Extended`: **You can give one primary partition and create `logical` partition in it and make that one partition to lot's of the other partitions**

---

### How `GPT` working?
**Is `GPT` most of the things are look like `MBR` but with a little and most important defferent, in `GPT` that `metadata` will clone and save on the other places and base on any reason if first `metadata` remove or inaccessable your `metadata` will restore or read from another ones and you can create 128 partitions with `18EB`**

---

### How to see list of discks?

```bash
ls /dev/sd*
```

### How to see discks with more informations?

```bash
lsblk
```

---

### How to create MBR partitions?

```bash
fdisk /dev/sdb
```

### Note: You can press `m` on your keyboard for help

### How to add new partition?
**You can press `n` on your keyboard and after that you see you can create `Primary` partition with `p` and `Extended` partition with `e`**

**If you choose `Primary` after that you can choose number of your partition and for first partition you can click `1` on your keyboard and after that you need to choose `First sector` of your partition, it's recommended to just click `Enter` on your keyboard for default sector and then you can choose your `Last sector` with different ways, If you need 1G just need to write `+1G`**

**If you choose `Extended` after that you can choose `First sector` like rencent ones but you can choose `Last sector` with only click on `Enter` because it's last partition**

### How to see created partitions?

```bash
p
```

### How to create logical partition?
**After you fully created fourth partitions if you again click `n` on your keyboard you can create logical partition number 5 and it's base on your `Extended` partition and whole steps are like creating `Primary` partitions**

### How to remove partitions?
**You can click `d` on your keyboard and choose number of your partition**

### Note: If you remove your `Extended` partition whole things like `Logical` partitions will delete either with him

### How to see list of partition types?

```bash
l
```

### How to change partition types?
**If you press `t` on your keyboard you can change your partitions type and after that you can see whole list of partitions with click `SHIFT + l` on your keyboard and enter that type code**

### How to confirm and write changes on disk?

```bash
w
```

### Note: If you don't enter `w` your changes won't save and write on your disk

---

### How to create GPT partitions?
**For first you need to give the path of your disk like this: `/dev/sdb`**

```bash
gdisk /dev/sdb
```

### Note: You can press `?` on your keyboard for help

### Note: Whole other things in `GPT` is look like `MBR`

---

### What is defferent between `ext2` and `ext4`?
**First thing is we have a file we call it `journal` file, this file write whole activities in it and for example if you want to copy a file your `OS` will write `copying start` and `copying done` if your system diuring an operation turn off and again you turn it on, your system will read `journal` file to know what your `OS` doing before shutdown, we didn't have `journal` file in `ext2` and for this reason we see a lot blue screen or other things like this but we have it in `ext4` and second thing is maximum single file you can have on `ext2` is `16GB` but on `ext4` is `16TB`**

---

### After you make your partitions you need to install file system on you partitions

```bash
mkfs -t ext4 /dev/sdb1

mkfs.ext4 /dev/sdb2
```

### Note: You can see more file system with `mkfs.` and `TAB + TAB`

### Note: Installing file system is something like format in windows

### How to see partitions information?

```bash
blkid
```

### You can extend your partitions base on your disk technology

**MBR & GPT**
```bash
parted
gparted --> graphical
```

**LVM**
```bash
lvextend
```

---

### After you installed file system on your partitions you need to mount your disks

**First of all you need to create a directory unless in `/tmp`**

```bash
mkdir /data_sdb1
```

**mount**
```bash
mount /dev/sdb1 /data_sdb1
```

### Note: Now if you put in `/data_sdb1` whole of theme will save and write on your sdb1

### How to unmount?

```bash
umount /dev/sdb1
```

### `Important Note`: If you create a directory and have some files in it before mount it whole data will save on that disk you created that directory and when you mount that directory to another disk all things you had in that directory will hide (Not remove) and after mount if you unmount your disk your recent files before mounting will show to you, and if you mounted you directory and have some files in it and you unmount your directory whole files on recent disk will hide (Not remove) and whole data will stay on that disk and if you mount again or create another directory and mount it to that disk your data will show again

### Note: If you mount your files with `mount` command after any shutdown your mount point will reset and you need to permanent your mount points

### How to permanent your mount points?
**You need to edit `/etc/fstab` file**

```bash
[partition-path] [directory-path] [file-system] [which-operations] [dump] [pass]

/dev/sdb1 /data_sdb1 ext4 defaults 0 0
```

### You can permanent with uuid
**For first you need to find your partitions `uuid`**
```bash
ls -l /dev/disk/by-uuid
```

### Note: only show that partitions you have installed file system

**After that you need to permanent your mounts in `/etc/fstab`**
```bash
/dev/disk/by-uuid/[uuid] /data_sdb1 ext4 defaults 0 0

/dev/disk/by-uuid/4a33c50b-6e61-4178-821d-73fcd6ba8d0c /data_sdb1 ext4 defaults 0 0
```

### Note: You can refresh your mounts without reboot and you can use `mount -a`

#### `partition-path`: **Give that partition you want to mount**
#### `directory-path`: **Give that directory you want to mount on your partition**
#### `file-system`: **That partition have which file system**
#### `which-operations`: **Do read, write or read and write**
#### `dump`: **Each time OS rebooted do a check disk**
#### `pass`: **After how many times OS restarted check whole super blocks are passed or not**

### You can check `/etc/fstab` file

```bash
mount -a
```

### How to know our check is correct?

```bash
echo $?
```

### Some guys saying `/mnt` is for put your mount directories

---

### How to know each file and directory is using how much disk space?

```bash
du
```

### Note: Use `-h` switch to see numbers human readable

### You can see specefic path

```bash
du -h /var/log
```

### How to see how much our directories in our path are using disk space?

```bash
du -sh
```

### Note: `-s` Switch is mean summarise

### You can see whole your directories disk space usage

```bash
du -sh *
```

---

### How to see disk free space?

```bash
df
```

### Note: Use `-h` switch to see human readable numbers

### How to see file system either?

```bash
df -T
```

### How to see inodes?

```bash
df -i
```

---

### How to repair your files?

**For `ext` file system check**
```bash
fsck -t ext4 /dev/sdb1

fsck.ext4 /dev/sdb1
```

### Note: If your partion be mount you can't run this command and you need unmount it

### You can see if run fsck what will happen on your disk and it's just showing not any activity

```bash
fsck.ext4 -n /dev/sdb1
```

### You can use force repair

```bash
fsck.ext4 -f /dev/sdb1
```

### Note: You can use `-y` switch to say yes to whole questions while repairing

### If fsck didn't work for you, you can use `tune2fs` and it's more aggressive

```bash
tune2fs -l /dev/sdb1
```

### Note: Read help guide

### You can use dumpe2fs
**You can use this tool either to recover your files and you can see your `super block (metadata)` with it**

```bash
dumpe2fs /dev/sdb1
```

### Note: Read help guide

**For `xfs` file system check**

```bash
xfsdump
xfsrepair
xfsinfo
etrfs
xfsrestore
xfs check
btrfs
zfs
```

### Note: `xfs` File system if not a lot only some uniq `OS` are xfs like `BSD`


### You must choose your file system base on your job, if you need your file size be small and have lots of file recommended to don't use `ext`