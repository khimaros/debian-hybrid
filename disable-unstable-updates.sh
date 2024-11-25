#!/bin/sh

set -xeuo pipefail

rm -f /etc/apt/preferences.d/unstable-security-packages
rm -f /etc/apt/apt.conf.d/99debsecan

apt update
