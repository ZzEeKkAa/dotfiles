#!/bin/bash

BUCKET='5b4aa67a-9679-4d02-865b-137d0f767d82'
DLE_VERSION='2025.0.0.345'

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${BUCKET}/intel-deep-learning-essentials-${DLE_VERSION}_offline.sh

sudo sh ./intel-deep-learning-essentials-${DLE_VERSION}_offline.sh -a --silent --cli --eula accept
#sudo sh ./intel-deep-learning-essentials-${DLE_VERSION}_offline.sh -a --silent --cli --eula accept --install-dir /opt/intel/oneapi25

