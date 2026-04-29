# ELK stack (Elasticsearch Logstash Kibana)

### `ELK stack` is a log analyzer but it's not for log monitoring, we use `ELK` when we have a `rsyslog server` and we need to analyz our logs

---

### `1`- You need to install java for ELK
```bash
apt update && apt install openjdk-17-jdk && java -version
```

---

### `2`- Add ELK mirror
**Give elastic mirror key**
```bash
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```

**Add ELK mirror**
```bash
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
```

**Update packages list**
```bash
apt update
```

---

### `3`- Install elasticsearch package

```bash
apt install elasticsearch -y
```

---

### `4`- Enable and start elasticsearch service

```bash
systemctl enable elasticsearch && systemctl start elasticsearch
```

---

### `5`- Make changes on elasticsearch yaml file

**You can have access to elasticsearch yaml file in `/etc/elasticsearch/elasticsearch.yml` route**
```bash
vim /etc/elasticsearch/elasticsearch.yml
```

**Add or uncomment these lines**
```bash
network.host: 0.0.0.0
http.port: 9200
discovery.type: single-node
```

**Comment this line**
```bash
cluster.initial_master_nodes: ["services"]
```

**If you don't have ssl on your server**
```bash
xpack.security.http.ssl:
  enabled: false
  keystore.path: certs/http.p12

xpack.security.transport.ssl:
  enabled: false
  verification_mode: certificate
  keystore.path: certs/transport.p12
  truststore.path: certs/transport.p12
```

---

### `6`- Restart elasticsearch service
```bash
systemctl restart elasticsearch
```

### Note: You need to restart again elasticsearch service after any changes on yaml file

---

#### `7`- Change elasticsearch password
```bash
/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```

---

### `8`- Test elasticsearch
```bash
curl -u elastic:[NEW_PASSWORD] http://localhost:9200
```

### Note: `elastic` before `:` is your username

---

### `9`- Install kibana package

```bash
apt install kibana -y
```

---

### `10`- Enable and start kibana service

```bash
systemctl enable kibana && systemctl start kibana
```

---

### `11`- Make changes on kibana yaml file

**You can have access to elasticsearch yaml file in `/etc/kibana/kibana.yml` route**
```bash
vim /etc/kibana/kibana.yml
```

**Add or uncomment these lines**
```bash
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"]
```

### Note: If you have ssl certificate on your `elasticsearch` use `https`

</br>

**If you don't have ssl certificate**
```bash
elasticsearch.ssl.verificationMode: "none"
```

**If you have basic auth on your elasticsearch**
```bash
elasticsearch.username: "kibana_system"
elasticsearch.password: "PASS"
```

---

### `12`- Restart kibana service
```bash
systemctl restart kibana
```

### Note: You need to restart again kibana service after any changes on yaml file

---

### `13`- Check kibana on your browser

```bash
http://SERVER-IP:5601
```

### Important note: You must to login with elastic username and password

### Note: If you have `ssl certificate` use `https`

---

### `14`- Install logstash package
```bash
apt install logstash -y
```

---

### `15`- 