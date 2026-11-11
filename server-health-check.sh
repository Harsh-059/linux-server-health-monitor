#!/bin/bash

# Linux Server Health Monitoring Tool

echo "=================================="
echo "     LINUX SERVER HEALTH CHECK"
echo "=================================="

# Current user
echo ""
echo "Server User: $(whoami)"

# Hostname
echo "Hostname: $(hostname)"

# Uptime
echo ""
echo "----- SERVER UPTIME -----"
uptime -p

# Disk usage
echo ""
echo "----- DISK USAGE -----"
df -h /

# Memory usage
echo ""
echo "----- MEMORY USAGE -----"
free -h

# Load average
echo ""
echo "----- SYSTEM LOAD -----"
uptime

# Service monitoring
echo ""
echo "----- SERVICE STATUS -----"

services=("ssh" "nginx" "docker")

for service in "${services[@]}"
do
    if systemctl list-unit-files "${service}.service" \
        --no-legend 2>/dev/null | grep -q "${service}.service"; then

        if systemctl is-active --quiet "$service"; then
            echo "$service: RUNNING"
        else
            echo "$service: STOPPED"
        fi
    else
        echo "$service: NOT INSTALLED"
    fi
done

echo ""
echo "=================================="
echo "       HEALTH CHECK COMPLETE"
echo "=================================="
