#!/bin/sh
IMAGE='diginc/pi-hole'
NIC='eth0'
export IP=$(ip addr show $NIC | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
docker-compose up --force-recreate --build
