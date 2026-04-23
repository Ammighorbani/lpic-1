# runlevel

```bash
 runlevel  		|				debian			   |		redhat                        |         info
----------------------------------------------------------------------------------------------------------------
	0			|				halt			   |  		halt                          | system is off
----------------------------------------------------------------------------------------------------------------
	1 			|	    	    single user	       | 		single user                   | it's like safe mode
----------------------------------------------------------------------------------------------------------------
	2			|	   		    multi user, gui    |  		multi user, without GUI       |
----------------------------------------------------------------------------------------------------------------
	3			|	   		    full multi user    | 		multiuser without network     |
----------------------------------------------------------------------------------------------------------------
	4   		|             	nothing            |        nothing                       |
----------------------------------------------------------------------------------------------------------------
	5   		|               full multi user	   |        multi user, with GUI          |
----------------------------------------------------------------------------------------------------------------
	6   		|          	    reboot             |        reboot                        |
```

---  

### How to see we are in which runlevel?

```bash
runlevel
```

---

### change runlevel

```bash
telinit 5  
init 5
```

---


### Note: 
**We have something about default runlever you can change your default runlevel**

---

### How to change default runlevel?
**You can change your default system runlevel with `systemctl` command like below**

#### Note: You need to find your specefic runlevel file name
**For example `runlevel 5` file name is `graphical.target`**

```bash
systemctl set-default graphical.target
```

**Also you can see your default runlevel like below**
```bash
systemctl get-default
```

#### Note: you  change your runlevel by editing this file
```bash
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
```

---

### Where is runlevels directory?
```bash
/etc/rc[1-6].d/
```

---

### What is `s` and `k` in runlevels directory?
**`S`**: **Mean start a process or service** <br>
**`K`**: **Mean kill a process or service**

---

### Where we can see whole our system process?
```bash
/etc/init.d/
```
---

### Note:
**Whole things in `rc` files are linked to that files in `init.d` directroy**

