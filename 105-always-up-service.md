# Always up service

### You can write your own services and that service be up 24/7 like ssh service

---

### What is exactly `.service` files?
**When we say ssh service or `ssh.service` file is not ssh project codes it's just a config fill and this config file comes up your project 24/7 base on these service file for example always you can make SSH connection or your web service is up for 24/7**

---

### Where is services directory?

```bash
/etc/systemd/system/
/usr/lib/systemd/system/ (orginal path)
```

#### Note: That files have `.service` extention are services config files

---

### How we can write our `.service ` config files?

```bash
[Unit]
Description=OpenBSD Secure Shell server
Documentation=man:sshd(8) man:sshd_config(5)
After=network.target auditd.service
ConditionPathExists=!/etc/ssh/sshd_not_to_be_run

[Service]
EnvironmentFile=-/etc/default/ssh
ExecStartPre=/usr/sbin/sshd -t
ExecStart=/usr/sbin/sshd -D $SSHD_OPTS
ExecReload=/usr/sbin/sshd -t
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartPreventExitStatus=255
Type=notify
RuntimeDirectory=sshd
RuntimeDirectoryMode=0755

[Install]
WantedBy=multi-user.target
Alias=sshd.service
```

#### Note: your config file must contain `[Unit]`,`[Service]` and `[Install]` and we call this format `systemd` config file format

---

