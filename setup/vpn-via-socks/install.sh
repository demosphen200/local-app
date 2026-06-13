#!/bin/bash

set -euo pipefail

TUN2SOCKS_VERSION="${TUN2SOCKS_VERSION:-v2.6.0}"
DNSPROXY_VERSION="${DNSPROXY_VERSION:-v0.81.4}"

case "$(uname -m)" in
    x86_64|amd64)  T2S_ARCH="amd64"; DNS_ARCH="amd64" ;;
    aarch64|arm64) T2S_ARCH="arm64"; DNS_ARCH="arm64" ;;
    armv7l)        T2S_ARCH="armv7"; DNS_ARCH="arm7"  ;;
    *) echo "неизвестная архитектура: $(uname -m)" >&2; exit 1 ;;
esac

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# --- tun2socks ---------------------------------------------------------------
T2S_ASSET="tun2socks-linux-${T2S_ARCH}.zip"
T2S_URL="https://github.com/xjasonlyu/tun2socks/releases/download/${TUN2SOCKS_VERSION}/${T2S_ASSET}"
echo ">> качаю tun2socks ${TUN2SOCKS_VERSION} ($T2S_ARCH)"
echo "   $T2S_URL"
curl -fSL "$T2S_URL" -o "$TMP/$T2S_ASSET"
unzip -oq "$TMP/$T2S_ASSET" -d "$TMP/t2s"
T2S_BIN="$(find "$TMP/t2s" -name 'tun2socks-linux-*' -type f ! -name '*.zip' | head -n1)"
[ -n "$T2S_BIN" ] || { echo "бинарь tun2socks не найден в архиве" >&2; exit 1; }
echo ">> устанавливаю /usr/local/bin/tun2socks"
sudo install -m 0755 "$T2S_BIN" /usr/local/bin/tun2socks

# --- dnsproxy (DoT-форвардер для DNS внутри ns) -------------------------------
DNS_ASSET="dnsproxy-linux-${DNS_ARCH}-${DNSPROXY_VERSION}.tar.gz"
DNS_URL="https://github.com/AdguardTeam/dnsproxy/releases/download/${DNSPROXY_VERSION}/${DNS_ASSET}"
echo ">> качаю dnsproxy ${DNSPROXY_VERSION} ($DNS_ARCH)"
echo "   $DNS_URL"
curl -fSL "$DNS_URL" -o "$TMP/$DNS_ASSET"
tar -xzf "$TMP/$DNS_ASSET" -C "$TMP"
DNS_BIN="$(find "$TMP" -name dnsproxy -type f | head -n1)"
[ -n "$DNS_BIN" ] || { echo "бинарь dnsproxy не найден в архиве" >&2; exit 1; }
echo ">> устанавливаю /usr/local/bin/dnsproxy"
sudo install -m 0755 "$DNS_BIN" /usr/local/bin/dnsproxy

# --- сам скрипт --------------------------------------------------------------
echo ">> устанавливаю /usr/local/bin/vpn2"
sudo install -m 0755 "$SRC_DIR/vpn2" /usr/local/bin/vpn2

echo
echo "Готово:"
echo "  $(command -v tun2socks)  ($(tun2socks --version 2>/dev/null | head -n1 || echo '?'))"
echo "  $(command -v dnsproxy)   ($(dnsproxy --version 2>/dev/null | head -n1 || echo '?'))"
echo "  $(command -v vpn2)"
echo
echo "Проверка (прокси должен слушать на 127.0.0.1:2080):"
echo "  vpn2 curl -s https://ifconfig.me ; echo"
