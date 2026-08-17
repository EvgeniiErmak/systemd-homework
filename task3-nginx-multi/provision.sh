#!/bin/bash
set -e

echo ">>> Task 3: nginx multi-instance provisioning"

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y nginx

systemctl disable --now nginx || true

mkdir -p /var/www/first /var/www/second
echo "<h1>Nginx instance: first (port 9001)</h1>" > /var/www/first/index.html
echo "<h1>Nginx instance: second (port 9002)</h1>" > /var/www/second/index.html

cp /vagrant/files/nginx-first.conf /etc/nginx/nginx-first.conf
cp /vagrant/files/nginx-second.conf /etc/nginx/nginx-second.conf

cp "/vagrant/files/nginx@.service" "/etc/systemd/system/nginx@.service"

systemctl daemon-reload
systemctl enable --now nginx@first
systemctl enable --now nginx@second

echo ">>> Done. Check with:"
echo "    systemctl status nginx@first"
echo "    systemctl status nginx@second"
echo "    ss -tnulp | grep nginx"
echo "    curl http://localhost:9001 ; curl http://localhost:9002"
