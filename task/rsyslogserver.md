### Create log server

make a rsyslog server and create rsyslog client on the other servers and after that transfer the other servers log to your rsyslog server with syslog protocol


best practice:
put a specefic hard disk for whole logs and use fdisk on your rsyslog server and mount your new disk and mount whole logs to it

when you use this solution if you have another service on your rsyslog server your other services or OS disk won't be full and make any problem only your logs disk will full and if you receive any error about disk storage you can for example make them gzip or remove them base on their date (this part is base on your company policies)





You can run `ELK` on your rsyslog server
`ELK`

E : Elastick search
L : logs stacks
K : kibana


`ELK` stack: it will search between your logs and make a graph of your logs and you can connect it to `graphana` (ELK stack is for log analize)


`graphana`: is for monitoring logs like `zabix`