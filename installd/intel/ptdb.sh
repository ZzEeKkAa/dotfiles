#!/bin/bash

BUCKET='884eaa22-d56f-45dc-9a65-901f1c625f9e'
PTDB_VERSION='0.5.3.36'
PTI_VERSION='0.9.0.38'

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${BUCKET}/l_intel-for-pytorch-gpu-dev_p_${PTDB_VERSION}_offline.sh
wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${BUCKET}/l_intel-pti-dev_p_${PTI_VERSION}_offline.sh

sudo sh ./l_intel-for-pytorch-gpu-dev_p_${PTDB_VERSION}_offline.sh -a --silent --cli --eula accept
sudo sh ./l_intel-pti-dev_p_${PTI_VERSION}_offline.sh -a --silent --cli --eula accept

