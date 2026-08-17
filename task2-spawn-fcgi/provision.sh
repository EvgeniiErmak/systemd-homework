#!/bin/bash
set -e

echo ">>> Task 2: spawn-fcgi provisioning"

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y spawn-fcgi php-cgi

cp /vagrant/files/spawn-fcgi.default /etc/default/spawn-fcgi
cp /vagrant/files/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service

systemctl daemon-reload
systemctl enable --now spawn-fcgi

echo ">>> Done. Check with: systemctl status spawn-fcgi"
echo ">>> Check with: ss -tnlp | grep 9000"
