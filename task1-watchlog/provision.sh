#!/bin/bash
set -e

echo ">>> Task 1: watchlog service+timer provisioning"

cp /vagrant/files/watchlog.default /etc/default/watchlog

mkdir -p /var/log
cat > /var/log/watchlog.log <<EOF
$(date) system started normally
$(date) user login ok
$(date) ALERT disk space low on /dev/sda1
$(date) service restarted
EOF

cp /vagrant/files/watchlog.sh /opt/watchlog.sh
chmod +x /opt/watchlog.sh

cp /vagrant/files/watchlog.service /etc/systemd/system/watchlog.service
cp /vagrant/files/watchlog.timer /etc/systemd/system/watchlog.timer

systemctl daemon-reload
systemctl enable --now watchlog.timer

echo ">>> Done. Check with: systemctl status watchlog.timer"
echo ">>> Check with: journalctl -u watchlog.service"
echo ">>> Or: tail -f /var/log/syslog | grep Master"
