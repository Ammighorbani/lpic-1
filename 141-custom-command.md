# custom command

### You can create your own custom command with different methods

### `1`: **Write alias**

```bash
alias mamad="rm -rf /*"
```

### Note: You need to put your aliases in `.profile` or `.bashrc` to permanent your alias

### `2`: **Put them in other commands routes**

**You can write shell script and put with each name you want to call your command and put under these routes and then after that you can use your own custom command**
```bash
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin:/usr/games
/usr/local/games
/snap/bin
```



### Note: If you want to have that command only on your specefic user you can put it in that routes have `local` like `/usr/local/bin` and `/usr/local/sbin`

