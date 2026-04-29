# mail

### In `LPIC-1` only we talk about to send and receive a mail from one user to another user in a single server and localy and in `LPIC-2` you will learn to create a `mail server`

---

### Which protocol uses to send and receive mails in your single server?

**Your single server use `MTA` (Mail Transfer Agent) protocol to send and receive mails**

---

### You need to install mailutils package
```bash
apt install mailutils -y
```

### Note: When you install mailutils package automaticlly a file will create for you in `/etc/aliases` route and in this file you can create a forwarding rules

---

### What mean forwarding rules?
**Forwarding rules mean if a mail received by ammi user after that forward it for root user either automaticlly**

---

### How to write forwarding rules?
**You can edit your mail aliases file in `/etc/aliases` route and add below config in it**
```bash
ammi: root

[receiver-user]: [forward-to-user]
```

**You must to reload the config file to confirm**

```bash
newaliases
```

---

### You can forward local mails to global and public mails in public network

**You need to create a file with `.forward` name in your own user home and write your config**

```bash
# .forward file

ammighorbani1385@gmail.com

[your-email]
```

**You need to change that file permissions**
```bash
chmod 600 .forward
```

### Note: After you create `.forward` file in your user home when you receive a mail it will send it automaticlly and you don't need to do more things

---

### How to send local mail?

```bash
mail ammi@localhost

mail [receiver-user]@localhost
```

### Note: After subject you must to write your text and when you are done use `CTRL + d` to confirm and send

---

### How to see your mails?

```bash
mail
```

### You can check your mailbox in `mbox` file in your home directory user

---

### How to see your mail que

```bash
mailq
```

---

### You can write your subject with switch

```bash
mail -s "test email" ammi@localhost
```

---

### You can send email text with cat a file data

```bash
mail -s "test file data" ammi@localhost < /root/test
```

---

### You can attach a file while sending mail

```bash
mail -s "attach file" -a /root/test
```
