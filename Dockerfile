FROM diginc/pi-hole:debian

RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy git

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
    && git checkout db
