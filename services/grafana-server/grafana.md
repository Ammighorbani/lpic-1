# Grafana (log monitoring)

### You can monitor your servers log with grafana

**Before grafana you need two other things**
#### `1`: **Loki (restore logs and give them to grafana)**
#### `2`: **Promtail (share logs to loki)**

### Note: Grafana and Loki will be in a server and promtail will be in another server with rsyslog server

---

## Grafana / Loki server

### `1`- Create a system user for loki
```bash
useradd --system loki
```

---

### `2`- Create directory and change owner

**Create directory**
```bash
mkdir -p /etc/loki /var/lib/loki
```

**Change owner**
```bash
chown loki:loki /var/lib/loki
```

---

### `3`- Install loki from github
**First of all you must to change your directory**
```bash
cd /usr/local/bin
```


```bash
wget https://github.com/grafana/loki/releases/download/v2.9.0/loki-linux-amd64.zip
```

---

### `4`- Install unzip to unzip files
```bash
apt install zip -y
```

---

### `5`- Unzip loki file and change name
```bash
unzip loki-linux-amd64.zip && mv loki-linux-amd64.zip loki
```

---

### `6`- If you file doesn't have execution permission change it
```bash
chmod +x /usr/local/bin/loki
```

---

### `7`- Create loki configuration file
**Create a file in `/etc/loki/config.yml` route and add below configuration in it**
```bash
auth_enabled: false

server:
  http_listen_port: 3100
  log_level: info

ingester:
  wal:
    enabled: true
    dir: /var/lib/loki/wal
  lifecycler:
    ring:
      kvstore:
        store: inmemory
      replication_factor: 1
    final_sleep: 0s
  chunk_idle_period: 5m
  max_chunk_age: 1h

schema_config:
  configs:
    - from: 2024-01-01
      store: boltdb-shipper
      object_store: filesystem
      schema: v11
      index:
        prefix: index_
        period: 24h

storage_config:
  filesystem:
    directory: /var/lib/loki/chunks

  boltdb_shipper:
    shared_store: filesystem
    active_index_directory: /var/lib/loki/index
    cache_location: /var/lib/loki/index_cache
    cache_ttl: 24h

compactor:
  working_directory: /var/lib/loki/compactor
  shared_store: filesystem

limits_config:
  ingestion_rate_mb: 16
  ingestion_burst_size_mb: 32
  max_cache_freshness_per_query: 10m

table_manager:
  retention_deletes_enabled: true
  retention_period: 168h  # keep logs 7 days
```

---

### `8`- Check or create configuration file directories
```bash
mkdir -p /var/lib/loki/{chunks,index,index_cache,compactor,wal} && chown -R loki:loki /var/lib/loki
```

---

### `9`- Create systemd for loki
**Create a file in `/etc/systemd/system/loki.service` route and add below configuration**

```bash
[Unit]
Description=Loki Log Aggregation System
After=network.target

[Service]
User=loki
Group=loki
Type=simple
ExecStart=/usr/local/bin/loki -config.file=/etc/loki/config.yml
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```

---

### `10`- Activate loki service
```bash
systemctl daemon-reload && systemctl enable loki && systemctl start loki && systemctl status loki
```

---

### `11`- Check loki activation
```bash
curl http://localhost:3100/ready
```

### Note: If everything be okay you must to see `ready`

---

### `12`- Install grafana requires
```bash
apt install apt-transport-https software-properties-common wget -y
```

---

### Add grafana repository
```bash
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - && echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list
```

---

### `14`- Update packages list
```bash
apt update
```

---

### `15`- Install grafana
```bash
apt install grafana -y
```

---

### `16`- Activate grafana service
```bash
systemctl enable grafana-server && systemctl start grafana-server && systemctl status grafana-server
```

---

## promtail server

### `17`- Install promtail
**First of all need to change your directory**

```bash
cd /usr/local/bin
```

**Install**
```bash
wget https://github.com/grafana/loki/releases/download/v2.9.0/promtail-linux-amd64.zip
```

---

### `18`- Unzip promtail file and change name
```bash
unzip promtail-linux-amd64.zip && mv promtail-linux-amd64.zip promtail
```

---

### `19`- If you file doesn't have execution permission change it
```bash
chmod +x /usr/local/bin/promtail
```

---

### `20`- Create a system user for promtail
```bash
useradd --system promtail
```

---

### `21`- Create directory and change owner

**Create directory**
```bash
mkdir -p /etc/promtail /var/lib/promtail
```

**Change owner**
```bash
chown promtail:promtail /var/lib/promtail
```

---

### `22`- Create promtail configuration file
**Create a file in `/etc/promtail/config.yml` route and add below configuration in it**
```bash
server:
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /var/lib/promtail/positions.yml

clients:
  - url: http://<loki-server-ip>:3100/loki/api/v1/push

scrape_configs:
  - job_name: rsyslog-remote-logs
    static_configs:
      - targets:
          - localhost
        labels:
          job: rsyslog-remote
          __path__: /var/log/remote/*/*
    pipeline_stages:
      - regex:
          expression: '(?P<hostname>[^/]+)/(?P<service>[^/]+)$'
          source: filename
      - labels:
          hostname:
          service:
```

### Note: Replace your loki server IP in this configuration

### Note: `__path__` pattern is about my rsyslog directory with `/var/log/remote` path, if your path is deferent you can change it

---

### `23`- Create systemd for promtail
**Create a file in `/etc/systemd/system/promtail.service` route and add below configuration**

```bash
[Unit]
Description=Promtail service
After=network.target

[Service]
User=promtail
Group=promtail
Type=simple
ExecStart=/usr/local/bin/promtail -config.file=/etc/promtail/config.yml
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

---

### `24`- Activate promtail service
```bash
systemctl daemon-reload && systemctl enable promtail && systemctl start promtail && systemctl status promtail
```

---

### `25`- Check your rsyslog directory permissions
**It's recommended to change one time your rsyslog directory to don't have any error on your `promtail`**

**If your rsyslog user group name is syslog**
```bash
chgrp -R syslog /var/log/remote
```

---

### `26`- Add promtail user to syslog group
**Add your promtail user to your rsyslog group to have access to your files**
```bash
usermod -aG promtail syslog
```

---

### `27`- Check promtail user permissions
```bash
id promtail
```

---

### `28`- One time restart whole services
**Promtail server**
```bash
systemctl restart promtail
```

**Grafana / Loki server**
```bash
systemctl restart loki && systemctl restart grafana-server
```

---

### `29`- Add loki to grafana
**Open grafana in your browser with `http://[your-IP]:3000` and login with `admin` user and new password**

**Then from left side menu click on `Explore` and put your data source on `Loki`**

---

### `30`- How to see logs in grafana?
**In `Explore` section look for a buttom with `Code` name and click on it, after that you can see a bar to write `Loki query`**

---

### `31`- How to write loki query
**We wrote `rsyslog-remote` job name in one of our files and now we can use it to find our logs**

```bash
{job="rsyslog-remote"}
```

**Base on hostname**
```bash
{job="rsyslog-remote", hostname="mamad"}
```

**Base on service name**
```bash
{job="rsyslog-remote", service="sshd"}
```

**Base on hostname and service name**
```bash
{job="rsyslog-remote", hostname="mamad", service="sudo.log"}
```

**Look for error logs**
```bash
{job="rsyslog-remote"} |= "error"
```

---

### `32`- Create dashboard for logs
**On left side menu  you can create dashboard to filter your logs, click on `Dashboards` and then `Create dashboard` and make your own custom dashboard**