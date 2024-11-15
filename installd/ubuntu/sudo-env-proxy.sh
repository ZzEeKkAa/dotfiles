#!/bin/bash

grep -l -r proxy /etc/apt/apt.conf.d | xargs sudo rm
sudo sed -i '/http_proxy/s/^#//g' /etc/sudoers
