<h1 align="center">Phantun</h1>

<p align="center">A lightweight and fast UDP to TCP obfuscator.</p>

<p align="center">
    <a href="https://ghcr.io/akafeng/phantun">Container Registry</a> ·
    <a href="https://github.com/dndx/phantun">Project Source</a>
</p>

<p align="center">
    <img src="https://img.shields.io/github/workflow/status/akafeng/docker-phantun/Docker%20Build" />
    <img src="https://img.shields.io/github/last-commit/akafeng/docker-phantun" />
    <img src="https://img.shields.io/github/v/release/akafeng/docker-phantun" />
    <img src="https://img.shields.io/github/release-date/akafeng/docker-phantun" />
</p>

---

### Environment Variables

| Name | Default | Example |
| --- | ---- | ---- |
| TZ | UTC | Asia/Shanghai |
| RUN_MODE | server | client |
| LOCAL_ADDR | - | - |
| REMOTE_ADDR | - | - |
| TUN_NAME | - | tun0 |
| TUN_LOCAL | 192.168.201.1 | - |
| TUN_PEER | 192.168.201.2 | - |

---

### Pull The Image

```bash
$ docker pull ghcr.io/akafeng/phantun
```

### Start Container

```bash
$ docker run -d \
  --device=/dev/net/tun \
  --cap-add=NET_ADMIN \
  --network=host \
  --restart=always \
  --name=phantun \
  ghcr.io/akafeng/phantun
```
