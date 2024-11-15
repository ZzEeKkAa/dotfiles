#!/bin/bash

# === Ubuntu installation instructions for this build ===

# Run the following commands to configure your system:

set -ex

CODENAME=jammy
LINUX_VERSION='6.8.0-40'

#Get device from
# lspci -k | grep -EA3 'VGA|3D|Display'
# https://github.com/torvalds/linux/blob/66ebbdfdeb093e097399b1883390079cd4c3022b/include/drm/intel/xe_pciids.h#L179-L200
#DEVICE=7d67 # ARL
#DEVICE=64a0 # LNL
#DEVICE=e20b # BMG
DEVICE=7d55 # MTL

sudo apt-get install -y curl gnupg
sudo mkdir -p /etc/apt/keyrings
wget -qO - https://repositories.intel.com/gpu/intel-graphics.key | \
	  sudo gpg --yes --dearmor --output /usr/share/keyrings/intel-graphics.gpg
echo "deb [arch=amd64,i386 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/gpu/ubuntu $CODENAME client" | \
	  sudo tee /etc/apt/sources.list.d/intel-gpu-${CODENAME}.list
sudo apt update

# Linux Kernel
sudo apt install -y linux-image-unsigned-${LINUX_VERSION}-generic linux-headers-${LINUX_VERSION}-generic

sudo apt -y upgrade
sudo apt -y autoremove

sudo apt install -y intel-opencl-icd intel-level-zero-gpu level-zero

sudo usermod -aG render ${USER}

# Update /etc/default/grub by adding "xe.force_probe='7d67' i915.force_probe='!7d67'" to GRUB_CMDLINE_LINUX_DEFAULT
sudo sed -i "s/nomodeset/nomodeset xe.force_probe='${DEVICE}' i915.force_probe='\!${DEVICE}'/" /etc/default/grub
sudo update-grub

#sudo reboot -h now


