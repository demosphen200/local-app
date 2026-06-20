#!/bin/bash

set -euo pipefail

# Версия sing-box: последняя стабильная, но ЗАФИКСИРОВАННАЯ (релизы SagerNet).
SINGBOX_VERSION="${SINGBOX_VERSION:-v1.13.13}"

case "$(uname -m)" in
    x86_64|amd64)  SB_ARCH="amd64" ;;
    aarch64|arm64) SB_ARCH="arm64" ;;
    armv7l)        SB_ARCH="armv7" ;;
    *) echo "неизвестная архитектура: $(uname -m)" >&2; exit 1 ;;
esac

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# --- sing-box ----------------------------------------------------------------
# Один движок закрывает весь конвейер: tun-inbound + fake-IP DNS + outbound в
# вышестоящий HTTP-прокси (CONNECT по ИМЕНИ). Заменяет связку tun2socks+dnsproxy.
SB_VER_NOV="${SINGBOX_VERSION#v}"
SB_ASSET="sing-box-${SB_VER_NOV}-linux-${SB_ARCH}.tar.gz"
SB_URL="https://github.com/SagerNet/sing-box/releases/download/${SINGBOX_VERSION}/${SB_ASSET}"
echo ">> качаю sing-box ${SINGBOX_VERSION} ($SB_ARCH)"
echo "   $SB_URL"
curl -fSL "$SB_URL" -o "$TMP/$SB_ASSET"
tar -xzf "$TMP/$SB_ASSET" -C "$TMP"
SB_BIN="$(find "$TMP" -name 'sing-box' -type f | head -n1)"
[ -n "$SB_BIN" ] || { echo "бинарь sing-box не найден в архиве" >&2; exit 1; }
echo ">> устанавливаю /usr/local/bin/sing-box"
sudo install -m 0755 "$SB_BIN" /usr/local/bin/sing-box

# --- сам скрипт --------------------------------------------------------------
echo ">> устанавливаю /usr/local/bin/vpn-us"
sudo install -m 0755 "$SRC_DIR/vpn-us" /usr/local/bin/vpn-us

# --- .env с параметрами прокси -----------------------------------------------
# vpn-us рядом с собой .env уже не найдёт (он в /usr/local/bin), поэтому, если
# локальный .env заполнен, кладём его в /etc/vpn-us.env (секрет, права 600).
if [ -f "$SRC_DIR/.env" ] && grep -q '^PROXY_HOST=.\+' "$SRC_DIR/.env"; then
    echo ">> устанавливаю /etc/vpn-us.env (из $SRC_DIR/.env)"
    sudo install -m 0644 "$SRC_DIR/.env" /etc/vpn-us.env
else
    echo ">> .env не заполнен — заполни $SRC_DIR/.env и скопируй в /etc/vpn-us.env,"
    echo "   либо запускай vpn-us из папки со скриптом, либо задай VPN_US_ENV=/путь/.env"
fi

echo
echo "Готово:"
echo "  $(command -v sing-box)  ($(sing-box version 2>/dev/null | head -n1 || echo '?'))"
echo "  $(command -v vpn-us)"
echo
echo "Проверка:"
echo "  vpn-us --check"
