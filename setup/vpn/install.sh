#!/bin/bash

set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

# Старая схема (systemd-юнит + setup-vpn-ns.sh) больше не нужна: сеть неймспейса
# поднимает сам скрипт vpn по требованию (vpn --ensure). Юнит гасим, чтобы он не
# создавал ns параллельно на старте системы.
if systemctl list-unit-files 2>/dev/null | grep -q '^setup-vpn-ns\.service'; then
    echo ">> выключаю старый setup-vpn-ns.service"
    sudo systemctl disable --now setup-vpn-ns.service || true
    sudo rm -f /etc/systemd/system/setup-vpn-ns.service /usr/local/bin/setup-vpn-ns.sh
    sudo systemctl daemon-reload
fi

echo ">> устанавливаю /usr/local/bin/vpn"
sudo install -m 0755 "$SRC_DIR/vpn" /usr/local/bin/vpn

echo ">> устанавливаю /usr/local/bin/no-vpn"
sudo install -m 0755 "$SRC_DIR/no-vpn" /usr/local/bin/no-vpn

echo
echo "Готово:"
echo "  $(command -v vpn)"
echo "  $(command -v no-vpn)"
echo
echo "Проверка:"
echo "  vpn --ensure && vpn --status"
echo "  vpn --check"
