Trying to build https://github.com/pi-hole/pi-hole/pull/731 for the purpose of https://github.com/pi-hole/pi-hole/pull/733

Usage
```bash
/bin/sh launch.sh
docker-compose exec pihole /bin/sh
./automated\ install/basic-install.sh
ls /etc/pihole/pihole.db # <---- fails. File not found
```
