FROM diginc/pi-hole:debian

RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy git nano

# Fix for needing to install dhcpd which depends on resolvconf which cannot be installed easily in a dockerfile
# https://github.com/docker/docker/issues/1297#issuecomment-115458690
RUN apt-get update -q \
    && echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy resolvconf

# install whiptail
# no need after close of https://github.com/pi-hole/pi-hole/pull/786
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy whiptail
WORKDIR /var/www/html
RUN mv admin admin-bkp \
    && git clone https://github.com/pi-hole/AdminLTE admin \
    && cd admin \
    && git fetch \
    && git checkout dbIntegrate

WORKDIR /etc/
RUN mv .pihole .pihole-bkp \
    && git clone https://github.com/pi-hole/pi-hole .pihole \
    && cd .pihole \
    && git fetch \
    && git checkout db \
    && git reset --hard origin/db
