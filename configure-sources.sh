#!/bin/sh

set -xeuo pipefail

cp -v ./00default-release /etc/apt/apt.conf.d/00default-release

cp -v ./default-priority /etc/apt/preferences.d/default-priority

cp -v ./sources.list /etc/apt/sources.list

apt update
