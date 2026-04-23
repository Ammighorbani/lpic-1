# Linux Commands  

## File Commands  

	ls ===>> Directory listing
	ls -1 ===>> show vertical
	ls -al ===>> Formatted listing with hidden files
	ls -lt ===>> Sorting the formatted listing by time modification
	ls /dev | grep sda ===>> show only sda in ls
	ls ? ===>> ?=ls one character




	cd dir ===>> Change directory to dir
	cd ===>> Change to home directory
	cd .. ===>> back to last directory
	cd - ===>> back to last directory you had been
	cd ===>> back to home directory
	cd ~ ===>> back to home directory
	cd \ --> make a new line if your are typing a long command you can break the line with this command and write the continue of your command in new line
    
    
    pwd ===>> show current working directory
	mkdir dir ===>> Creating a directory dir
	mkdir -p ===>> make parents directory
	more file ===>> Output the contents of the file
	less file ===>> output the contents of the file
	head file ===>> Output the first 10 lines of the file
	head -n 20 ===>> show 20 lines
	tail file ===>> Output the last 10 lines of the file
	tail -n 20 ===>> show 20 line
	tail -f file ===>> Output the contents of file as it grows,starting with the last 10 lines
	touch file ===>> Create or update file
	touch file{1..10}.txt ===>> you can make 10 file
	rm file ===>> Deleting the file
	rm -r dir ===>> Deleting the directory
	rm -f file ===>> Force to remove the file
	rm -rf dir ===>> Force to remove the directory dir
	cp file1 file2 ===>> Copy the contents of file1 ro file2
	cp -r dir1 dir2 ===>> Copy dir1 to dir2;create dir2 if not present  

-----------------------------------------------------------------------  


-----------------------------------------------------------------------  

	ps ===>> To display the currently working processes
	ps -aux ===>> show all process
	ps ===>> process
	ps -a ===>> show all process
	ps -au ===>> show all users process
	ps aux ===>> show all kernel process
	ps -aux | grep sleep
	top ===>> Display all running process
	kill pid ===>> Kill the process with given pid
	kill %(name program) ===>> kill program
	killall (name) ===>> Kill all the process named proc
	pkill (name process) ===>> Will kill all processes jobs,resume a stopped job in the background
	jobs ===>> process that run
	fg ===>> Bring the most recent job to foreground
	fg n ===>> Bring job n to the foreground
	sleep 5
	sleep 1000 &
	jobs
	fg %(number)
	ctrl + z ===>> stop
	pgrep sleep
	kill (process ID)
	killall sleep
	kill -9 (process ID)
	pkill (name)  

## cat commands  

	cat file ===>> show file text
	cat -n file ===>> show number 
	cat > file3 ===>> write in this file
		ctrl + d ===>> go out side the file

## System info  

	date ===>> Show the current date and time
	date +%s ===>> show more about time	
	cat /proc/cpuinfo ===>> show cpu information
	cat /proc/meminfo ===>> show memory information
	cat /proc/filesystem ===>> show all file system linux
	blkid ===>> show uuid
	lscpu ===>> more information about cpu
	lsusb ===>> more information about usb
	lshw ===>> information about all your hardware
	lsmem ===>> more information about memory
	lspci ===>> more information about your connectore
	lsmod ===>> show all modules
	modeprobe -r (name of modules)===>> remove modules from kernel (not from whole system)
    modeprobe (name of modules)===>> install modules from kernel (not from whole system)
	cat /proc/modules ===>> show all modules
	file ===>> show your type of file
	uptime ===>> Show current uptime
	w ===>> Display who is on line
	whoami ===>> Who you are logged in as
	uname -a ===>>  Show kernel infomation
	cat /proc/cpuinfo ===>> Cpu information
	man command ===>> Show the manual for command
	df ===>> Show the disk usage
	du ===>> Show directory space usage
	free ===>> Show memory and swap usage
	free -h ===>> show memory usage
	free -m ===>> show in megabite
	free -g ===>> show in gigabite
	whereis app ===>> Show possible location of app
	which app ===>> Show which application will be run by default
	wc -l (name of file) ===>> show how many lines have the file
	dmesg ===>> show recent logs when the os is up
	cat /var/log/syslog ===>> show all logs
	lsb_release -a ===>> show your os
	cat /etc/os-release ===>> show your os
	top ===>> show cpu and memory and network usage
	pgrep (name program) ===>> find process id
	which ls
 	whereis ls
 	ldd ===>> show your dependency
	ldd /usr/bin/ls ===>> share library
 		/etc/ld.so.conf
 			/etc/ld.so.conf.d/*.conf
 		/etc/ld.so.cash
	ldconfig -v
	lsblk ===>> show all disk
	grub-mkconfig  

## lvm commands

	pvdisplay
	vgdisplay
	lvdisplay

## shutdown & reboot commands  

	runlevel ===>> show runlevel
	telinit 5 ===>> change runlevel
	init 5  

## make variable  

	VAR1=behnam
 	echo $VAR1
 	unset VAR1 ===>> delete variables
 	export ===>> you can use every shell
 	echo $$ ===>> uuid
 	exit  

## Searching  

	grep pattern file ===>> Search for pattern in file
	grep -r pattern dir ===>> Search recursively for pattern in dir
	command | grep pattern ===>> Search pattern in the output of a command
	locate  file ===>> Find all instances of file
	with names starting with filename
	grep pattern ===>> Searches for all the named processes, that matches with the pattern and, by default, returns their ID
	history
 	history -c ===>> clean
 	ctrl + r ===>> search
 	!sudo ===>> execute last command with sudo
 	!cat ===>> execute last command with cat
 	!! ===>> execute last command
	tree dir1 ===>> show everything in direcrory  

## find command  

	find . -name ===>> filename Search in the current directory(represented by a period) and below it, for files and directories 
	###########################
	find . -size +100M
	find . -size -100M



## File Permission  

	chmod octal file ===>> change the permission of file to octal, which can be found separately for user, group, world by adding, 4-read(r), 2-write(w), 1-execute(x)  

 

## Network  

	ping host ===>> Ping host and output results
	ping -c 4 8.8.8.8
	dhclient ===>> take ip from dhcp
	ifconfig ===>> show ip and netmask
	netstat -s ===>> show your drop packet
	whois domain ===>> Get whois information for domains
	dig domain ===>> Get DNS information for domain
	dig -x host ===>> Reverse lookup host
	wget file ===>> Download file
	wget -c file ===>> Continue a stopped download
	curl ===>> download from internet  

## Shortcuts  

	ctrl+c ===>> Halts the current command
	ctrl+z ===>> Stop the current command, resume with fg in the foreground or bg in the background
	ctrl+d ===>> Logout the current session, similar to exit
	ctrl+w ===>> Erase one word in the current line
	ctrl+u ===>> Erase the whole line
	ctrl+r ===>> Type to bring up a recent command
	!vim ===>> excute last file with vim
	!! sudo ===>> execute last command in sudo
	!! ===>> Repeats the last command
	exit ===>> Logout the current session  

## swap commands  

	swapon -s
	swapoff /seap.img
	swapon /swap.img  


## tr commands  

	tr is IS
 	tr [:lower:] [:upper:]
 	tr [:space:] '\t' ===>> use tab
 	tr -d [:digit:] ===>> clean digit
 	tr -dc [:digit:] ===>> clean word  

## sort & uniq commands  

	uniq -c ===>> show how many
 	uniq -d ===>> show repeated
 	uniq -u ===>> show not repeated  

## edit commands  

 	head -n 5 file1 ===>> show 5 first line
 		head -5
 	tail -n 5 file1 ===>> show 5 last line
 		tail -5
 		tail -f /var/log/syslog ===>> open file 
	tac ssh_config | head -n 4 
	cut  -d: -f1 ===>> seprete
	paste file1 file2 ===>> merge two file
	paste -d: file1 file2 ===>> merge two file with :
	join ===>> good for script database
	pr ===>> print
	fmt -w 3- fiel1 ===>> show in old monitor
	nl ===>> number
	split -l 3 file1 ===>> seprate file in line
	splite -b 1000MB file1 ===>> seprate file in weght
	yes > file1 ===>> make file

## sed command  

	 



## shutdown & reboot  

	shutdown
	shutdown -P ===>> poweroff
	shutdown -h ===>> halt
	shutdown -r ===>> reboot
	shutdown -c ===>> cancel
	shutdown -r now
	shutdown -r 13:15 
	shutdown -P +15
	reboot -p ===>> poweroff
	reboot -f ===>> force
	poweroff -P ===>> shutdown
	poweroff -f ===>> force
	/var/log/wtmp ===>> show who reboot the server
	halt -p
	halt -f
	telinit 6
	init  

## other commands  

	sleep (time) & ===>> process go background
	elinks (URL) ===>> open browser in terminal
	sudo pkill -t tty3
	~ ===>> home user
	$ ===>> user
	# ===>> root
	hal ===>> hardware abstraction layer
	udev ===>> set rule
	; 
	|| ===>> or
 	&& ===>> and
	nl ===>> number line
	stat file1 ===>> show all
	accesstime
	modifytime
	changetime
	tee ===>> show on scren
	wall ===>> send massage to other user
	nc -l 8990 ===>> port you can talk (net cat)
	nc 8990 (ip destination)
	auditd = log 
	var/log/wtmp ===>> how type reboot
	chmem -e 1G ===>> use memory
	chmem -d 1G ===>> delete memry in use
	uuid ===>> universal uniq ID
	uuidgen ===>> make a new uuid 
	cp ===>> copy file or directory
	scp ===>> copy file or directory
	
	tee ===>> copy file and directory but show everything
