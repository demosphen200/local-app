#!/bin/bash

NS_NAME="vpn"
IFACE="ens36"
NS_IP="172.16.103.101/24"
NS_GW="172.16.103.249"
DNS1="8.8.8.8"
DNS2="8.8.4.4"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log "Запуск настройки неймспейса $NS_NAME"

if ! ip link show $IFACE > /dev/null 2>&1; then
    log "ОШИБКА: Интерфейс $IFACE не найден"
    exit 1
fi

if ip netns list | grep -q "^$NS_NAME$"; then
    log "Неймспейс $NS_NAME уже существует, пропускаем создание"
else
    log "Создаём неймспейс $NS_NAME"
    ip netns add $NS_NAME
    ip link set $IFACE netns $NS_NAME
    ip netns exec $NS_NAME ip link set lo up
    ip netns exec $NS_NAME ip addr add $NS_IP dev $IFACE
    ip netns exec $NS_NAME ip link set $IFACE up
    ip netns exec $NS_NAME ip route add default via $NS_GW
    log "Сеть настроена: IP=$NS_IP, шлюз=$NS_GW"
fi

log "Настраиваем DNS: $DNS1, $DNS2"
sudo mkdir -p /etc/netns/$NS_NAME
cat > /etc/netns/$NS_NAME/resolv.conf << EOF
nameserver $DNS1
nameserver $DNS2
EOF

log "Настройка неймспейса $NS_NAME завершена"
