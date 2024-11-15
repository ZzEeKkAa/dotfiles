#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive
#export DEBIAN_PRIORITY=critical

sudo -E apt -qy update
sudo -E apt -qy -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade
sudo -E apt -qy autoremove
sudo -E apt -qy autoclean

