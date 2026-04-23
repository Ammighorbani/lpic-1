# top / htop

**Old one**
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