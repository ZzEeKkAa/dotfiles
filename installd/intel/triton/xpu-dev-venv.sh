#!/bin/bash

set -ex

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
PROJECTS=$HOME/Projects
# with X.X version
PYTHON=python3.9

sudo apt install -y build-essential cmake ninja-build ccache
sudo apt install -y ${PYTHON}-venv ${PYTHON}-dev
# NOTE: Use libze1 and libze-dev if level-zero and level-zero-dev does not work.
sudo apt install -y level-zero-dev intel-opencl-icd intel-level-zero-gpu zlib1g-dev 

${PYTHON} -m venv $PROJECTS/triton/.venv
source $PROJECTS/triton/.venv/bin/activate

pip install --upgrade pip

pip install -r $PROJECTS/pytorch/requirements.txt
pip install pytest pytest-select
pip install matplotlib pandas tabulate

mkdir $VIRTUAL_ENV/lib/$PYTHON/site-packages/intel_extension_for_pytorch

# XPU fix https://github.com/intel/torch-xpu-ops/issues/585
# echo "c50fc3ea4572b9259c8eab365b30c50ce8f1a55a" > $PROJECTS/pytorch/third_party/xpu.txt


#eval "$(conda shell.bash hook)"
#conda env create -n xpu-dev -f $BASEDIR/conda_envs/xpu_dev.yaml
#conda activate xpu-dev
#cp /etc/OpenCL/vendors/intel.icd $CONDA_PREFIX/etc/OpenCL/vendors/intel-ocl-gpu.icd

#VERBOSE=1 DEBUG=1 USE_DISTRIBUTED=1 USE_XPU=1 USE_MKLDNN=1 USE_CUDA=0 BUILD_TEST=0 USE_FBGEMM=0 USE_NNPACK=0 USE_QNNPACK=0 USE_XNNPACK=0 CC=x86_64-conda-linux-gnu-gcc CXX=x86_64-conda-linux-gnu-g++ SYCL_ROOT=$CONDA_PREFIX INTEL_MKL_DIR=$CONDA_PREFIX INTEL_COMPILER_DIR=$CONDA_PREFIX LD_LIBRARY_PATH=$CONDA_PREFIX/lib BUILD_CUSTOM_PROTOBUF=0 pip install -e . -v --no-build-isolation

