#/bin/bash

sudo cp setup-vpn-ns.service /etc/systemd/system/setup-vpn-ns.service
sudo cp setup-vpn-ns.sh /usr/local/bin/setup-vpn-ns.sh
sudo cp vpn /usr/local/bin/vpn
sudo cp no-vpn /usr/local/bin/no-vpn

sudo systemctl daemon-reload
sudo systemctl enable setup-vpn-ns.service
sudo systemctl start setup-vpn-ns.service
sudo systemctl status setup-vpn-ns.service
