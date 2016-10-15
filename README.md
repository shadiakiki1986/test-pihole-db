Trying to build https://github.com/pi-hole/pi-hole/pull/731 for the purpose of https://github.com/pi-hole/pi-hole/pull/733

Usage
```bash
bash launch.sh # launches pihole on local port 81
docker-compose exec pihole bash
cd /etc/.pihole
./automated\ install/basic-install.sh
ls /etc/pihole/pihole.db # <---- fails. File not found
```
