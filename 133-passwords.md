# Passwords

### How you can see your passwords?
**You can see your password in `/etc/shadow` route**

```bash
ammi:$y$j9T$2z4ipENjMeYIKeg.GFRHd1$2c9EBwkQWt/TQnTVFIqbkVILQcMSUVyfxgwMpv5JLQ9:20511:0:99999:7:::

[Username]:[Password]:[Password-changed]:[Min-day-change-password]:[Password-expire]:[Password-expire-warning]
```

#### `Username`: **Users username**
#### `Password`: **Hashed password**
#### `Password-changed`: **How many days passed from 0 sec base on unix time**
#### `Min-day-change-password`: **How many days later you can change your password**
#### `Password-expire`: **When your password will expire**
#### `Password-expire-warning`: **How many days before expiration of password you will receive notification**

### How to see better information about users?

```bash
chage -l ammi
```

### How to change password information?

```bash
chage ammi
```