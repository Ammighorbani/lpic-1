# Linux commands

### This file is base on `LPIC-1` 103 module

---

### echo 

### `echo` Command print something for you
**Inpute**
```bash
echo "Hello world!"
```

**Output**
```bash
Hello world!
root@mamad:~#
```

### You can use echo without new line
**Inpute**
```bash
echo -n "Hello world!"
```

**Output**
```bash
Hello world!root@mamad:~#
```

### How to print special characters in linux
**You can print special characters with using `\`**
**Inpute**
```bash
echo \#
echo "\#"
```

**Output**
```bash
#
#
```

### How to use somethings like tab, new line and the others?
**Inpute**
```bash
echo -e "lets \tlearn \tLinux"
```

**Output**
```bash
lets    learn   Linux
```

**Inpute**
```bash
echo -e "lets \vlearn \vLinux"
```

**Output**
```bash
lets
     learn
           Linux
```

**Inpute**
```bash
echo -e "lets \nlearn \nLinux"
```

**Output**
```bash
lets
learn
Linux
```

### How to know recent command was executed successfully?
**If your recent command executed successfully only you must to receive `0`** </br>
**Inpute**
```bash
echo $?
```

**Output**
```bash
0
```

### How to see my bash shell process id?
**We use it to know if we opened a bash in bash is our bash changed or not** </br>
**Inpute**
```bash
echo $$
```

**Output**
```bash
1423
```

### How to see a variable value?

**Inpute**
```bash
echo $VAR1
```

**Output**
```bash
mamad
```

---

### Logical operations

### `;` Help you to run some cammands in one line and one by one but this logical opeation doesn't matter is recent command exuted successfully or not it will run commands one by one

**Inpute**
```bash
ls ; cd /var ; ls
```

**Output**
```bash
bash-script  note-lpic-1.txt  snap  sources.list.back  sshd_config  time.txt
backups  cache  crash  lib  local  lock  log  mail  opt  run  snap  spool  tmp  www
```

### `||` Is logical or if first command be correct it will execute it and finish but if first command be incorrect second command will execute and finish if both commands be incorrect it will only finish

**First one be correct** </br>
**Inpute**
```bash
ls || cd /var
```

**Output**
```bash
bash-script  note-lpic-1.txt  snap  sources.list.back  sshd_config  time.txt
```

**second one be correct** </br>
**Inpute**
```bash
ls /mamad || pwd
```

**Output**
```bash
/root
```

**Both one be incorrect** </br>
**Inpute**
```bash
ls /mamad || mamad
```

**Output**
```bash
ls: cannot access '/mamad': No such file or directory
mamad: command not found
```

### `&&` Is look like logical and, this logical operation only execute when first command executed successfully

**Inpute**
```bash
apt update && apt upgrade -y
```

**Output**
```bash
.......
```

---

### Variable

### How to make variable?

```bash
VAR1=mamad
```

### How to remove a variable?

```bash
unset VAR1
```

### Note: If you created a variable in shell that variable is only useable in that shell

### How to create global variable?
**For first you need to create your variable  and then make it global in all shells**

```bash
export VAR1
```

---

### Shell / Bash

### How to open bash in shell?

```bash
bash
```

### How to open shell in shell?

```bash
sh
```

### How to exit from bash or shell

```bash
exit

CTRL + d
```

### How to see other shells on OS with which command runed and more info?

```bash
w
```

---

### How to know we are in which path?

```bash
pwd
```

---

### history

### `history` Command help you to see which commands were executed on our OS

```bash
history
```

### How to search in our history?

```bash
CTRL + r
```

**After `CTRL + r` you can do reverse search for example write `vim` and you can see recent command you have executed with `vim`**

### How to run recent command with specefic command?

```bash
!cat
```

### Note: This command will run your recent command don't run it base on chance

### How to remove our history?

```bash
history -c
```

### How to run a command in debian base linux and don't save in history?
**For first you need to put space and then write the command**
```bash
 ls
```

### If someone cleared your history how you can to see it?

```bash
cat .bash_history
```

---

### uname

### `uname` Command we use to know what is our `OS` developed base on, for example you want to write a script for multi `OS` and you want to say if `Linux` do this if `Unix` do this and you can use `uname` command

```bash
uname
```

### How to give full information about our `OS`?

```bash
uname -a
```

### How to give kernel release?

```bash
uname -r
```

### How to see kernal name?

```bash
uname -s
```

### How to give version of OS?

```bash
uname -o
```

### How to see processor?

```bash
uname -p
```

### How to see hardware platform?

```bash
uname -i
```

---

### How to see OS release?

```bash
cat /etc/os-release

lsb_release -a
```

---

### man

### `man` Command help you to see some information about that command you need information or help, it's look like document of that command

```bash
man ls
```

### How to search in man pages?
**Whole things are like vim syntax, you can use `/[pattern]` to find what you want and use `n` on your keyboard to go next pattern you have like that pattern**

### How to see only description of commands?

```bash
man -f ls
```

### How to give manual page whereis of command?

```bash
man -w ls
```

---

### apropos

### `apropos` Command help you to see that command used in which commands and other things base on manual pages

**Input**
```bash
apropos echo
```

**Output**
```bash
echo (1)             - display a line of text
lessecho (1)         - expand metacharacters
pam_echo (8)         - PAM module for printing text messages
ping (8)             - send ICMP ECHO_REQUEST to network hosts
ping4 (8)            - send ICMP ECHO_REQUEST to network hosts
ping6 (8)            - send ICMP ECHO_REQUEST to network hosts
```

---

### cat

### cat Command help you to read files data
```bash
cat mamad.txt
```

### You can merge files with other
```bash
cat mamad.txt mamadhacker.txt
```

### How to write or rewrite in file?

```bash
cat > mamad.txt (After write need CTRL + d)
cat file1 > mamad.txt
```

### How to cat two files but write something in the middle of them?

```bash
cat mamad.txt - mamadhacker.txt
```

### Note: After writing you need to `ENTER` and for finish writing you need `CTRL + d`

### How to append in file?
**You can use `>>` whole things are working like `>` **

### What is deferent between `>` and `>>`?
**Deferent between these two is `>` if that file exist it will remove data and write as zero like empty file but `>>` will append at the end of file**

### Note: you can use `>` and `>>` in other things it's not only for echo

---

### How you can give command output as input to another command?
**You can do it with `|`**

```bash
cat sshd_config | less
```

### How to put number start of lines?
```bash
cat -n mamad.txt
```

### Note: This method will put number start of newline and enters either

---

### tr

### `tr` Command is like a translator you can find a pattern and change it to what you want

**Inpute**
```bash
echo "this is elon musk" | tr is IS
```

**Output**
```bash
thIS IS elon muSk
```

### Note: `tr` will map character to character but most activity of `tr` is for validation for example password validation

### How to upper case lower case things?

**Input**
```bash
echo "this is elon musk" | tr [:lower:] [:upper:]
```

**Output**
```bash
THIS IS ELON MUSK
```

### You can change spaces to tab

**Input**
```bash
echo "this is elon musk" | tr [:space:] '\t'
```

**Output**
```bash
this    is      elon    musk
```

### How to remove digits?

**Input**
```bash
echo "this is elon musk 123" | tr -d [:digit:]
```

**Output**
```bash
this is elon musk
```

### How to give only numbers?

**Input**
```bash
echo "this is elon musk 123" | tr -dc [:digit:]
```

**Output**
```bash
123
```

---

### pr

### `pr` Command can make your file look like printer format it can make paging for you or add some free space start and end of file

```bash
pr mamad.txt
```

---

### nl

### `nl` Command put number start of lines to know how many lines we have

### Note: `nl` won't put number start of new line and enters

### How to put numbers in left side?

```bash
nl -nln mamad.txt
```

### How to put numbers in right side?
**This one is default of `nl`**

```bash
nl -nrn mamad.txt
```

### How to put zero befor numbers?

```bash
nl -nrz mamad.txt
```

---

### fmt

### `fmt` will change max lenght character in each line

```bash
fmt -w 15 mamad.txt
```

### Note: This command won't make `Enter` in your files just change showing method

---

### sort & uniq

### `sort & uniq` Command two different command but they must to use togather

```bash
sort mamad.txt | uniq
```

### Note: Sorting always will be modify base on that system programing language

### How to know how many duplicated word?

```bash
sort mamad.txt | uniq -c
```

### How to see duplicated things?

```bash
sort mamad.txt | uniq -d
```

### How to see that things are not duplicated?

```bash
sort mamad.txt | uniq -u
```

### You can sort and uniq a file and save it into another file
**We call this thing `chain` commands**
```bash
cat mamad.txt | sort | uniq > mamadhacker.txt
```

---

### spllit

### `split` Command using when you have a huge file and you can't cat it, you can split that file to smaller part and cat the last part

### How to split base on line?
```bash
split -l [How many line] mamad.txt
```

### How to split base on file size?
```bash
split -b 100MB mamad.txt
```

### Note: If you have a file with 10GB and you use split your 10GB will duplicate and if you don't have enough space never execute this command

---

### How to create a larg file?
```bash
yes > mamad.txt
```

### Note: `yes` Command will use a lot of you ram and cpu and it only 3 seconds can make a file with for example 3GB file

---

### wc

### `wc` Command will give you three number, first one is `lines`, second one `words` and `size` of file

```bash
wc mamad.txt
```

### How to see only number of lines?
```bash
wc -l mamad.txt
```

### How to see number of words?
```bash
wc -w mamad.txt
```

### How to see file size?
```bash
wc -b mamad.txt
```

---

### head

### `head` Command will show you custom number lines from first of file
**By default it will show you 10 lines**
```bash
head mamad.txt
```

### How to show custom number?
```bash
head -n 15 mamad.txt
```

---

### tail

### `tail` Command will show you custom number lines from end of file
**By default it will show you 10 lines**
```bash
tail mamad.txt
```

### How to show custom number?
```bash
tail -n 15 mamad.txt
```

### You can follow a file if anything new added see it live
**Most of the time people use it for log files**

```bash
tail -f mamad.txt
```

---

### cut

### `cut` Command if you have a file with specefic delimeter you can see that column you need

**Your file**
```bash
w:afsbfsdfg,mamad
e3:akfvb,asdgjk
3432:akjgs,taghusfbjk
```

**Input**
```bash
cut mamad.txt -d: -f1
```

`-d`: **Is your delimiter**
`-f1`: **Is column one**

**Output**
```bash
w
e3
3432
```

**Input**
```bash
cut mamad.txt -d: -f2
```

`-d`: **Is your delimiter**
`-f2`: **Is column two**

**Output**
```bash
afsbfsdfg,mamad
akfvb,asdgjk
akjgs,taghusfbjk
```

### Note: When you use `-f2` your system will going to find second your delimeter parameter

**Input**
```bash
cut mamad.txt -d, -f1
```

`-d`: **Is your delimiter**
`-f1`: **Is column one**

**Output**
```bash
w:afsbfsdfg
e3:akfvb
3432:akjgs
```

### If you need middle part

**Input**
```bash
cut mamad.txt -d, -f1 | cut -d: -f2
```

`-d`: **Is your delimiter**
`-f1`: **Is column one**
`-f2`: **Is column two**

**Output**
```bash
afsbfsdfg
akfvb
akjgs
```

---

### paste

### `paste` Command can paste some files next to next

**Input**
```bash
paste mamad.txt mamadhacker.txt
```

**Output**
```bash
w     afsbfsdfg
e3     akfvb
3432     akjgs
```

### You can remove space and put specefic delimiter bbetween them

**Input**
```bash
paste -d: mamad.txt mamadhacker.txt
```

**Output**
```bash
w:afsbfsdfg
e3:akfvb
3432:akjgs
```

### Note: You can use any delimiter you want

---

### join

### `join` Command can choose some things in files and remove uniq things but between two file

**mamad.txt**
```bash
1 a
2 b
4 g
5 l
```

**mamadhacker.txt**
```bash
1 q
3 d
4 k
5 p
```

**Input**
```bash
join mamad.txt mamadhacker.txt
```

**Output**
```bash
1 a q
4 g k
5 l p
```

---

### sed

### `sed` Command is look like find patter and replacement in `vim` but with out opening the files

```bash
sed 's/yes/no/g'
```

### How to write in file our change?
**You can use `-i` switch**

```bash
sed -i 's/yes/no/g'
```

### How to be case insensitive?

```bash
sed -i 's/yes/no/gi'
```

#### `s`: **For replacement**
#### `g`: **For doing global**
#### `i`: **For case insensitive**

---

### grep

### `grep` Command help you to search in text base files and find your pattern

```bash
grep [pattern] [filename]

grep ssh /etc/ssh/sshd_config
```

### You can use it in pipe

```bash
cat /etc/ssh/sshd_config | grep ssh
```

### How to be case insensitive?

```bash
cat /etc/ssh/sshd_config | grep -i ssh
```

### How to find lines our pattern are not there?

```bash
cat /etc/ssh/sshd_config | grep -v ssh
```

### How can we see some lines after and before our pattern line?

**After**
```bash
cat /etc/ssh/sshd_config | grep -A[number] ssh

cat /etc/ssh/sshd_config | grep -A3 ssh
```

**Before**
```bash
cat /etc/ssh/sshd_config | grep -B[number] ssh

cat /etc/ssh/sshd_config | grep -B3 ssh
```

### You can find specefic file with knowing that file name between lot's of files

```bash
ls /etc | grep ssh
```

### You can do group search in directories
**You can use `-r` switch and it's mean recursive**

```bash
grep -r ssh .
```

### Note: `.` Means search in this route now i am

### You can do glubing with regex
**Glubing is `*`, `?` and...**

```bash
grep -E
```

### Note: We have a command with `egrep` and it's similar

---

### ls

### `ls` Command help you to see list of files and directories in your route

```bash
ls
```

### You can do it in specefic route
```bash
ls /home
```

### My favourite switchs
```bash
ls -ltrha
```

#### `-l`: **List of files**
#### `-t`: **Base on time**
#### `-r`: **Recursive**
#### `-h`: **Human readable**
#### `-a`: **Show all things**

### You can make ls but in each line only have one file name
```bash
ls -1
```

---

### cp

### `cp` Command can copy file for you
```bash
cp /home/mamad.txt .
```

### Note: `.` Is mean do it in this route i am

```bash
cp /etc/apt/sources.list /root
```

### You can copy more than one files

```bash
cp mamad.txt mamadhacker.txt /root
```

### You can copy a directory with whole files in it

```bash
cp -r dir1 /root
```

---

### mv

### `mv` Command is look like cut paste in windows

```bash
mv mamad.txt /root
```

### You can move directories

```bash
mv dir1 /root
```

### You can move more than one things

```bash
mv file1 mamad.txt /root
```

### You can do rename

```bash
mv mamad.txt asghar.txt
```

---

### touch

### `touch` Command can make empty file for you

```bash
touch mamad.txt
```

### You can make multi files

```bash
touch file1 mamad.txt mamadhacker.txt

touch file{1..100}
```

### You can make file with your favourit time

**Input**
```bash
touch -t [year][month][day][time] mamad.txt

touch -t 2512211725 mamad.txt
```

**Output**
```bash
-rw-r--r--  1 root root    0 Dec 21 17:25 mamad.txt
```

---

### stat

### `stat` Command can show you `modify`, `change`, `access` and `birth` time to you

```bash
stat mamad.txt
```

### Note: If someone created a file with unreal time you can see real birth time with stat

---

### mkdir

### `mkdir` Command can make direcroty for you

```bash
mkdir mamad
```

### You can make multi directories

```bash
mkdir mamad mamadhacker
```

### You can make directory and make another directory in it

```bash
mkdir -p mamad/mamadhacker/mamadkheilihacker
```

---

### tree

### `tree` Command show directory to directories to you better

**Input**
```bash
/mamad
```

**Output**

```bash
mamad/
|____mamadhacker
     |_________mamadkheilihacker

2 directories, 0 files
```

---

### rm

### `rm` Command can remove files or directories for you

```bash
rm mamadhacker.txt
```

```bash
rm -r mamadhacker/

rmdir mamadhacker/
```

### Note: If you remove something in linux you dont have anything like trash in windows to recover it 

### If you have any problem while removing and you can't remove base on any reseon you can use do it like below

```bash
rm -rf mamadhacker/
```

### How to remove whole things?

```bash
rm -rf *
```

---

### ?

### `?` Any `?` you add is look like one character if you use two question mark you can ls two characters files

```bash
ls ?

ls ?.txt
```

### Note: You can use it for other commands like `cp` or `mv`

---

### []

### `[]` You can give a range

```bash
ls [a-zA-z0-9]
```

### Note: You can use it for other commands like `cp` or `mv`

---

### *

### `*` Is mean whole things

```bash
rm *.txt
```

---

### find

### `find` Command can search in whole of your system where you want to find what you want

```bash
find /
```

**Input**
```bash
find / -name ammi
```

**Output**
```bash
/run/sudo/ts/ammi
/home/ammi
```

### You can only search for files

```bash
find / -name ammi -type f
```

### You can only search for directories

```bash
find / -name ammi -type d
```

### You can search insensetive
**With using `-i`**
```bash
find / -iname ammi 
```

### You can search base on file size

```bash
find / -iname ammi -size +100M

find / -iname ammi -size +1G
```

### You can search base on file size between two size

```bash
find / -iname ammi -size +100M -size -200M

find / -iname ammi -size +1G -size -100G

find / -size +100M -size -1G
```

---

### zip

### `zip` Command can make files to zip

```bash
zip [which-name-you-want] [your-file]

zip mamad.zip mamad.txt
```

### Note: This command best performance is only on text base files not videos and pictures

### How to unzip?

```bash
unzip mamad.zip
```

### Note: When you use zip command you source file will exist in zip and unzip command

---

### gzip

### `gzip` Command can make your file zip but with better performance

```bash
gzip [your-file]

gzip mamad.txt
```

### How to unzip?

```bash
gunzip mamad.txt.gz
```

### How to muximum compretion?

```bash
gzip -9 mamad.txt
```

### Note: When you use gzip or gunzip your source file will remove

---

### bzip2

### `bzip2` Command can make your files but with best compretion but not best performance

```bash
bzip2 mamad.txt
```

### How to unzip?

```bash
bunzip2 mamad.txt.bz2
```

---

### xz

### `xz` Command can zip your files with best performance and best compretion

```bash
xz mamad.txt
```

### How to unzip?

```bash
unxz mamad.txt.xz

xz -d mamad.txt.xz
```

### Note: Most new ziping tools is `xz` and better to use this one

---

### file

### `file` Command can give you information about your files

**Input**
```bash
file mamad.txt.xz
```

**Output**
```bash
mamad.txt.xz: XZ compressed data, checksum CRC64
```

**Input**
```bash
file mamad.txt
```

**Output**
```bash
mamad.txt: ASCII text
```

---

### tar

### `tar` Command will make archive for you in linux and it's recommended when you zip a file archive it either

```bash
tar -cvf [which-name-you-want] [your-file]

tar -cvf mamad.tar mamad.txt
```

### How to extract tar file?

```bash
tar -xvf [your-file] [which-name-you-want]

tar -xvf mamad.txt mamad.tar
```

### Note: `-f` must be last switch to give file name

### How to `gzip` and `tar` in same command?

```bash
tar -cvzf [which-name-you-want] [your-file]

tar -cvzf mamad.tar.gz mamad.txt
```

### How to extract and unzip in same command?

```bash
tar -xvzf [your-file] [which-name-you-want]

tar -xvzf mamad.tar.gz mamad.txt
```

### How to `bz2` and `tar` in same command?

```bash
tar -cvjf [which-name-you-want] [your-file]

tar -cvjf mamad.tar.bz2 mamad.txt
```

```bash
tar -xvzf [your-file] [which-name-you-want]

tar -xvzf mamad.tar.bz2 mamad.txt
```

#### `c`:**Create**
#### `v`:**Verbose**
#### `f`:**Get file**
#### `x`:**Extract**
#### `z`:**Zip**
#### `j`:**bz2**

### Note: You can zip and tar directories either

---

### dd

### `dd` Command is look like `cp` command but with more features like bootable disk or copy full disk on another disk
**We have a little trick with `dd` command think about you have 10 servers and you need to install `OS` on whole of theme, you can plug a disk on one of them and install `OS` and do fully configuration your system and then copy whole disk with `dd` command and write on the other disks and after that you have 10 disk with same `OS` and configuration and you can plug each disk on each server**

```bash
dd if=/etc/ssh/sshd_config of=/var/log/sshlog.txt
```

### Note: Speed of `dd` command is too much

### How to write disk on another disk?

```bash
dd if=/dev/sda of=/dev/sdb
```

### Note: If you have `ISO file` give your input that file

### How to write zero byte file on OS?

```bash
dd if=/dev/zero of=/root/mamad
```

### How to create custom size file?

```bash
dd if=/dev/zero of=/root/mamad bs=1M count=100
```

#### `if`: **Input file**
#### `of`: **Output file**
#### `bs`: **Block size**
#### `count`: **Count of blocks**

---

### tee

### `tee` Command can do two things in same time, first one show recent command output and second one redirect it to the file

```bash
ls > tee mamad.txt
```

### Note: `tee` Command will write on file not append

### How to append in file with tee?

```bash
ls > tee -a mamad.txt
```

---

### sleep

### `sleep` Command will give your terminal for that time you wrote

```bash
sleep 5
```

---

### &

### `&` Sign send your proccess or jobs to background

```bash
sleep 1000 &
```

### How to see jobs list

```bash
jobs
```

### How to move jobs from background to foreground

```bash
fg %[pid]

fg %1
```

### Note: Whole jobs in background will proccess with same speed and priority but most of cpu priority actually for last job, that one have `+` sign

### You can stop proccess
**If you move a job to foreground and use `CTRL + z` that proccess will stop**

### Note: Whole jobs only in your session will set if you close your session your jobs will remove

---

### tmux

### `tmux` package is a tool for you to create a staible session on your OS

```bash
tmux
```

### If your internet disconnected and you loged in again you can see your list of tmux sessions

```bash
tmux ls
```

### How to attach to your session?

```bash
tmux att -t [sid]

tmux att -t 0
```

### Note: Your sessions while your OS is up they are available 

### My favourite tool is `byobu`

---

### ps

### `ps` Command will show you that proccess are run

```bash
ps
```

### How to see all proccess

```bash
ps -a
```

### How to see all users proccess?

```bash
ps -au
```

### How to see that proccess are runed in whole OS?

```bash
ps -aux
```

### How to see process are run now with more information

```bash
ps -fl
```

---

### pgrep

### `pgrep` Command will be like normal grep but on your proccess

```bash
pgrep sleep
```

---

### kill

### `kill` Command can kill process with their process ids

```bash
kill 2342
```

### You can do force kill

```bash
kill -9 2343
```

### How to kill all process about specefic command?

```bash
killall sleep
```

---

### pkill

### `pkill` Command can kill process base on their process id or command name

```bash
pkill firefox
```

---

### top

### `top` Command show your system usage and process

```bash
top
```

### Note: `top` Will refresh each 3 seconds

### How to change top delay?
**You can press `d` on your keyboard and enter that number of second you want**

### Load avrage if be nearer to zero your OS is healthier

### What is zombie process?
**We call `zombie` that process don't have any parent or that process parent died and that process creating multi child process like viurses and your `OS` will detect it as `zomibe` process**

### `%CPU(s)` Is about your cpu usage
**`us` mean process created by users and `sy` process created by system and `ni` must be nearer to zero, it's mean your `OS` healghtier and `id` must nearer to 100 and `wa` How much your server is waiting for `CPU` to process**

### How to change color?
**You can press `z` on your keyboard**

### How to see absolute path of our commands?
**You can press `c` on your keyboard**

### How to kill process?
**You can press `k` on your keyboard and then give that process id, if you don't give process id `top` will kill first process**

### How to sort base on `CPU` usage?
**You can press `SHIFT + p` on your keyboard**

### How to sort base on `Memory` usage?
**You can press `SHIFT + m` on your keyboard**

### How to help page?
**You can press `h` on your keyboard**

### How to exit from top?
**You can press `q` on your keyboard**

### You can use `htop` and `bpytop` either

---

### free

### `free` Command only show your memory status and use only for monitor the memory

```bash
free
```

### How to see numbers human readable?

```bash
free -h
```

### Show base on `M`

```bash
free -m
```

### Show base on `G`

```bash
free -g
```

---

### uptime

### `uptime` Command will show you how much your OS is up

```bash
uptime
```

---

### nice & renice

### `nice & renice` Is about jobs priority in your OS
**`nice & renice` number is between `-20 +19`, if you near to `+19` your priority is lower and if you near to `-20` your priority is higher and automaticlly nice for each jobs are `0`**

### How to see process are run now with more information

```bash
ps -fl
```

**`nice` Is for job will run now**

```bash
nice -n -10 sleep 5000
```

**`renice` Is for job is still run but you want to change it priority**

```bash
renice [nice-number] [pid]

renice 10 2342
```

### Note: Normal users can change nice but only can plus numbers for example change it from 10 to 11 but only root user can minus numbers for example change it from 0 to -1