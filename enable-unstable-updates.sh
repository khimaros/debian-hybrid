#!/bin/sh

set -xeuo pipefail

apt install -y debsecan

cp -v ./debsecan-apt-priority /usr/sbin/debsecan-apt-priority

chmod 755 /usr/sbin/debsecan-apt-priority

cp -v ./99debsecan /etc/apt/apt.conf.d/

ln -sf /var/lib/debsecan/apt_preferences /etc/apt/preferences.d/unstable-security-packages

apt update
