#!/usr/bin/env bash

BUILD_PACKAGES=(
    g++
)

RUNTIME_PACKAGES=(
    python3-dev
    python3-pip
    python3-setuptools
)

apt install -y --no-install-recommends ${BUILD_PACKAGES[*]}
apt install -y --no-install-recommends ${RUNTIME_PACKAGES[*]}

# Wifi service:
## Bind path for wpa
mkdir -p /var/run/wpa_supplicant/
cd /home/pi/services/wifi/ && python3 setup.py install

# Ethernet service:
cd /home/pi/services/cable_guy/ && python3 setup.py install

apt -y remove ${BUILD_PACKAGES[*]}
apt -y autoremove
apt -y clean