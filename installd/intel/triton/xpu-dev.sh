#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
PROJECTS=$HOME/Projects

# PYTORCH sources
git clone git@github.com:pytorch/pytorch.git $PROJECTS/pytorch
cd $PROJECTS/pytorch
git remote add zeka git@github.com:ZzEeKkAa/pytorch.git
git remote add alex git@github.com:alexbaden/pytorch.git
git fetch origin
git fetch zeka
git fetch alex

git checkout triton-zeka

git submodule update --init --recursive

# TRITON sources
git clone git@github.com:triton-lang/triton.git $PROJECTS/triton
cd $PROJECTS/triton
git remote add zeka git@github.com:ZzEeKkAa/triton.git
git remote add intel git@github.com:intel/intel-xpu-backend-for-triton.git
git fetch origin
git fetch zeka
git fetch intel

git checkout llvm-target


