# Flask Self-Host

The following are instructions on how to set up a self-hosted Flask instance on an Ubuntu system.

## Set up firewall

```bash
apt-get update && apt-get upgrade -y

ufw allow ssh
ufw allow http
ufw allow https
ufw default deny
ufw enable

reboot
```

## Set up Docker

```bash
apt update
apt install ca-certificates curl git
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

apt update
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Set up Flask

```bash
git clone https://github.com/flsknet/self-host.git flsk
cd flsk
chmod +x ./generate.sh
./generate.sh [HOSTNAME]

docker compose up -d
```
