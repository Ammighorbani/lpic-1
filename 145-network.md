# Network

### We will talk about network in linux

---

### Internet protocol or IP
**We have a protocol in network and we call it `Internet Protocol` or `IP` and you can make a connection between more than one computer**

---

### We have two modules of IP
#### `1`: **IPv4**
#### `2`: **IPv6**

---
### IPv4 syntax

**Each `IP octed` can be between `0-255`**

```bash
0-255.0-255.0-255.0-255

192.168.107.159
```

---

### IP octed
**Each `IP octed` containe 8 bit**

```bash
-    -    -    -    -    -    -    -.--------.--------.--------

128  64   32   16   8    4    2    1
```

**Exapmle**

```bash
10.1.23.19

00001010.00000001.00010111.00010011
```

---

### How much IPs you can create with IPv4?

**You can create `255 * 255 * 255 * 255` or `255^4` or `4,228,250,625` IPs**

---

### We have 2 types of IP

#### `1`: **IP public**
#### `2`: **IP private**

---

### We have difference class of pulic IPv4

#### `1`: **Class A**
```bash
From 1.0.0.0 to 126.255.255.255

Default subnet mask / NetId: 255.0.0.0
```


#### `2`: **Class B**
```bash
From 128.0.0.0 to 191.255.255.255

Default subnet mask / NetId: 255.255.0.0
```

#### `3`: **Class C**
```bash
From 192.0.0.0 to 223.255.255.255

Default subnet mask / NetId: 255.255.255.0
```

#### `4`: **Class D**
```bash
From 224.0.0.0 to 239.0.0.0

Default subnet mask --> Multicast
```

#### `5`: **Class E**
```bash
From 240.0.0.0 to 254.255.255.255

Default subnet mask --> Experimental
```

### Note: In IPv4 in range `127.*.*.*` is for `loopback` or `localhost`

### Note: In normal usage you can use IPs between class A-C

---

### We have difference class of private IPv4

#### `1`: **Class A**
```bash
From 10.0.0.0 to 10.255.255.255
```

#### `2`: **Class B**
```bash
From 172.16.0.0 to 172.31.255.255
```

#### `3`: **Class C**
```bash 
From 192.168.0.0 to 192.168.255.255
```

---

### What is NAT (Network Address Translation)?

**Think about you have a `LAN (Local Area Network)` and you want to connect it to the Internet, cause `IPv4` only have something around 8 billion count and it's going to be full we have something we call it `mask`, mask will tell you don't worry about your LAN systems, I'll transfer your LAN data by my own name (IP) in whole around the world in the Internet, when you check your IP in internet you will see that mask IP, If you have a LAN and you have a single `modem router` in whole of your LAN, Internet don't need whole of your LAN systems IPs, it will only need your modem router IP and when you search your modem router IP in `Internet` you can see some information about your `ISP` and your `timezone` info**

---

### What is gatway?

**When you have an `OS` or `LAN` you must to tell your network you must go out from which door we call that door `gateway`**

---

### What is DNS (Domain Name Service)?

**Think about you have a single IP address in whole around the world and `Internet`, after that absolutely you can memorise it but when you have 2 billion IP addresses you can't memories whole of them, for this problem we do something to memorise addresses in Internet better and easier, we convert them from normal IP addresses to unique names**

```bash
google.com = 8.8.8.8
```

**When you search for a domain at first your system will check your `/etc/hosts` file and after that if it can't find answer and ip for that domain, your system will check `/etc/resolv.conf` file and this file is linked to `/run/systemd/resolve/stub-resolv.conf` and in this file you will set your `DNS` or `nameservers`**

---

### How to unlink your resolv.conf file?
```bash
unlink /etc/resolv.conf
```

### Note: We unlink this file because if you make any change in this file, your OS after a while time will check and copy orginal file data in it, we unlinked it to have a file with static data and our configuration don't change each time

---

### How to change priorities of check which files for DNS
**You can see your files priorities in `/etc/nsswitch.conf` route**

---

### How to ask from other nameservers about an IP?

```bash
nslookup google.com
```

---

### You can see DNS information about a domain

```bash
host yahoo.com
```

```bash
dig google.com
```

**You can just see IPs**
```bash
dig google.com +short
```

---

### What is HTTP protocol?
**It's `connection oriented` protocol and stabel, we use it for some jobs like websites and browsers**

#### How does it work?
```bash
handshake

ake send alive
synake send back alive notification
```

---

### What is TCP (Transmission Control Protocol) protocol?
**`TCP` is a protocol to transfer data and packets whole around the network**

#### How does it work?

```bash
handshake

ake send data - 1
ake knowledge receive notification - 1

ake send data - 2
ake knowledge receive data - 2
```

### Note: You will have lot's of trafick but you know whole your packets are transfered

### Note: In `TCP` if you send a packet and your `receiver` don't send an answer about it received the packet sender will send it again while your receiver receive and send receive notification or ake knowledge

### Note: We use TCP protocol when we need to transfer important packets and need to trasfer data completely

---

### What is UDP (User Datagram Protocol)?

```bash
handshake
ake send data - 1
ake send data - 2
```

### Note: `UDP` is super faster than `TCP` but we are not sure whole packets transfer correctly and completely

---

### What is ICMP protocol?

**It's more for network management and use in some tools like `ping` and use for connection testing between two side**

---

### What is ping?
**You can check you connection to an `IP` or `domain`**
```bash
ping 8.8.8.8

ping google.com
```

**You can ping with limited time pinging**
```bash
ping -c 4 8.8.8.8
```

**You can ping with specefic delay**
```bash
ping -i 5 8.8.8.8 --> each 5 second one time
```

**You can of specefic interface of your system**
```bash
ping -I ens33 8.8.8.8 --> use specefic interface
```

---

### What is port?

**ports are the doors to enter, move and exit from the different sides, you can see ports on your linux in `/etc/services` route and you have only 65536 ports on your linux**

---

### How to see our IP in linux?

```bash
ip

ifconfig
```

### Note: `ifconfig` only show you up network cards if you need to see all network cards use `ifconfig -a`

---

### Use ifconfig

**See your `IP`**
```bash
ifconfig
```

**See your `IP` and down interface either**
```bash
infcongi -a
```

**See your `IP` but summery**
```bash
ifconfig -s
```

**Set static `IP` on your network `interface`**
```bash
ifconfig ens33 192.168.107.159

ifconfig [interface-name] [your-IP]
```

**Set static `netmask` on your `interface`**
```bash
ifconfig ens33 netmask 255.255.255.0

ifconfig [interface-name] netmask [your-netmask]
```

**Set static `IP` and `netmask` on your `interface`**
```bash
ifconfig ens33 192.168.107.159 netmask 255.255.255.0

ifconfig [interface-name] [your-IP] netmask [your-netmask]
```

****

### Important Note: Never use dynamic IPs on your servers only set their IP static

---



### What is DHCP (Dynamic Host Configuration Protocol)?


---

### How to set default gateway or default route?
**You need to use `route` command**
```bash
route
```

**See your routing table**
```bash
route -n
```

**Add default route**
```bash
route add default gw 192.168.107.100
```

**Remove route**
```bash
route del default gw 192.168.107.100
```

### Note: Whole these routes are temporary and you must to permanent them in a file

---

### IP command
**You can do network management and configuration with `IP` command**

**See your `IP`**
```bash
ip a

ip a s

ip addr sh

ip address show
```

**Add `IP`**
```bash
ip addr add 192.168.107.159/24 dev ens33

ip addr add [your-ip/netmask] dev [interface-name]
```

**Remove `IP`**
```bash
ip addr del 192.168.107.159/24 dev ens33

ip addr del [your-ip/netmask] dev [interface-name]
```

**Down `interface`**
```bash
ip link set ens33 down
```

**Up `interface`**
```bash
ip link set ens33 up
```

**See routing table**
```bash
ip r

ip r s

ip ro sh

ip route show
```

**Add route**
```bash
ip route add 10.10.10.10 via 192.168.107.2 dev ens33

ip route add [your-ip] via [destination-ip] dev [interface-name]
```

**Add default route**
```bash
ip route add default via 192.168.107.2 dev ens33

ip route add default via [destination-ip] dev [interface-name]
```

**Remove route**
```bash
ip route del 10.10.10.10 via 192.168.107.2 dev ens33

ip route del [your-ip] via [destination-ip] dev [interface-name]
```

```bash
ip route del default via 192.168.107.2 dev ens33

ip route del default via [destination-ip] dev [interface-name]
```

### Note: Whole these routes are temporary and you must to permanent them in a file

---

### Where is network configuration management permanent files?

**Ubuntu**
```bash
/etc/netplan/
```

**Debian**
```bash
/etc/network/interfaces
```

**Centos**
```bash
/etc/sysconfig/network-scripts/
```

---

### How to set permanent static IP?
**In `ubuntu` open `/etc/netplan/00-installer-config.yaml` file and add below configuration in it**

```bash
network:
  ethernets:
    ens33:
      dhcp4: true
  version: 2

# This part is about new interface
    ens34:
      dhcp4: no
      addresses:
        - 192.168.107.158/24
      gateway4: 192.168.107.2
      nameservers:
        addresses: [8.8.8.8, 4.2.2.4]
  version: 2

```

**In `centos` create a file with `ifcfg-[interface-name]` name in `/etc/sysconfig/network-scripts` and use below configuration**
```bash
# static IP address on Centos7

TYPE=Ethernet
BOOTPROTO=none
IPADDR=192.168.107.159
PREFIX=24
GATEWAY=192.168.107.2
DNS1=8.8.8.8
DNS2=4.2.2.4
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6NINIT=no
NAME=eth0
DEVICE=eth0
ONBOOT=yes
```

### Note: If you put `BOOTPROTO` on `dhcp` your interface will use dhcp and it won't be static

**In `debian` create a file with each name you want in `/etc/network/interfaces.d` and use below configuration**
```bash
# static IP address on Debian

auto eth0
iface eth0 inet static
    address 192.168.1.10
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8
```

### Note: You must turn off `DHCP` to be able set static `IP`

---

### How to confirm changes on your network file
**In `ubuntu` after you make changes on your `.yaml` file use `netplan try` to check your configuration and confirm your configurations or use below command**

```bash
netplan apply
```

### Note: It's recommended to use `netplan try` to first check and then confirm changes cause second command won't check your configuration only confirm and permanent your configuration

### Note: If you see any warning don't worry they are normal

**In `centos` you need to use below command to restart or confirm your configuration file**
```bash
systemctl restart network && systemctl status network
```

### Note: It's better to get a status of your service cause if you have any error or problem on your configuration file, know it and fix it

**In `debian` you need to use below command to restart or confirm your configuration file**
```bash
systemctl restart networking && systemctl status networking
```

---

### How to trace your network route between you and your destination

```bash
traceroute 8.8.8.8
traceroute google.com

tracepath 8.8.8.8
tracepath google.com

mtr 8.8.8.8
mtr google.com
```

---

### How to see open ports on server?
**You can use `netstat` and `ss` these two command are similar but `ss` is newer and their switchs are similar either**
```bash
netstat
```

**You can see whole open connections**
```bash
netstat -a
```

**You can see whole TCP connections**
```bash
netstat -at
```

**You can see whole UDP connections**
```bash
netstat -au
```

**You can see number of each port**
```bash
netstat -an
```

**You can see which proccess using your port**
```bash
netstat -ap
```

---

### You can see can you connect to a specefic port or no
```bash
telnet 192.168.107.158 22
```

### Note: If you see connecting it's mean you can't access to that port

---

### How to open specefic port?
```bash
netcat -l 8090
```