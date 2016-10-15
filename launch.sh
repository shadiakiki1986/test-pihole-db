#!/bin/bash
IMAGE='diginc/pi-hole'
NIC=`ip route get 8.8.8.8|awk '{print $5}'` # e.g. ens32 or eth0
if [[ ! "$NIC" =~ "ens" && ! "$NIC" =~ "eth" ]]; then
  echo "Trying to get NIC from 'ip route' failed. Aborting"
  exit 1
fi
export IP=$(ip addr show $NIC | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

# Step 1: run an existing instance. This will create /etc/pihole/setupVars.conf which leads to the update prompt later
docker-compose up  -d --force-recreate --build
