# Alias

### This command can help you to use long commands or any other things with that name you want

---

### How to see our OS aliases?

```bash
alias
```

### Important note: If you are working for first time before anythings use alias commands to see recent guy has set any dangerous aliases for you or not

---

### How to create new alias?

```bash
alias [name]="[command]"

alias ammi="rm -rf /*"
```

### Note: You need to permanent your aliases and you can do it with two ways, if you need them only for your self you can save them in `.bashrc` or `.profile` but if you need them for whole users you can save them in `/etc/profile`, you can [read more](128-login-none-login-shells.md) about these files

---

### You can create your own file and when each user loged in that file will copy for them in their files
**For example you need to share a file between whole users and it's better to put them in `/etc/skel` route and each time someone log in that file will share with him**

