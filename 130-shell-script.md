# Shell Script

### You can use shell \ bash scripting to automate your jobs

---

### How to use variable?

**Creating**
```bash
MYVAR=ammi
```

**Usign**
```bash
echo $MYVAR --> ammi
```

### Note: It's better to write variables with capital letters

---

### How to use function?

**Creating**
```bash
myfunc() {
    ls /
    cd /var/log
    pwd
    ls
}
```

**Usign**
```bash
myfunc
```

---

### How to use array?

**Creating**
```bash
mylist=(lets learn linux)
```

**Usign**
```bash
echo ${mylist[2]} --> linux
```

**Creating**
```bash
mylist=("lets" "learn linux")
```

**Usign**
```bash
echo ${mylist[1]} --> learn linux
```

---

### How to start script?
**You must to start your script with `#!/bin/bash` to your `OS` can read your linux commands**

### Note: Always write lots of descriptions look like what you script doing or who and when wroted and write note for each line or functions

---

### How to create script file

**Simple script**
```bash
#!/bin/bash

# This script will call your name

NAME="ammi"

echo $NAME
```

### Note: your file doesn't have execution permission and you need to add it with `chmod +x ammi.sh`

---

### How to run script files?
**You can use `bash` command**
```bash
bash ammi.sh
```

**You can use `./`**
```bash
./ammi.sh
```

---

### Note: You can use whole things like commands and the other things in shell scripting

---

### How to get input from users?

```bash
read VAR
```

**It's better to use read with `-p` switch to write a text while getting input**

```bash
read -p "Enter your age: " AGE
```

**You can use your input like below**
```bash
read -p "Enter your age: " AGE

echo "Your age is $AGE"
```

### Note: always when you want to use your variables you must use `$NAME`

### How to give input without showing in monitor
**Your `OS` use this thins when you are trying to login**
```bash
read -s -p "Enter your pass: " PASS

echo $PASS
```

---

### How to write conditional code
**You can use `if` syntax**

```bash
#!/bin/bash

read -p "Enter your age: " AGE

echo "Your age is $AGE"

if test $AGE -ge 18
then
        echo "Age is valid" && touch /home/file$AGE
        ls /home | grep file$AGE
else
        echo "Age is invalid"
fi
```

---

### How to run and debug your scripts?

```bash
bash -x ammi.sh
```
---

### If user give letter but we needed digit what we must to do?
**We must to validation users input always and you can do it with lots of ways in your scripts**

---

### You can compair things with another way

```bash
#!/bin/bash

read -s -p "Enter your pass: " PASS

if test $PASS = "ammi"
then
        echo "Pass is valid"
else
        echo "Pass is invalid"
fi
```

---

### How to use for loop?
**You can use `for` syntax**

```bash
#!/bin/bash

for i in {1..5000}
do
        touch /home/ammi/file$i.txt
done
```

