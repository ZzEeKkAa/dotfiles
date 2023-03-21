#!/bin/bash

if ! [ -d $CONDA_HOME ]; then
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
    bash Miniforge3-$(uname)-$(uname -m).sh -b -p $CONDA_HOME -s
fi
