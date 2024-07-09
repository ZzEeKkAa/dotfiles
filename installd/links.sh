#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

rm ~/.zshrc
ln -s $BASEDIR/zshrc ~/.zshrc
mkdir -p ~/.zshrcd/init
cat $BASEDIR/zshrcd/conda.sh > ~/.zshrcd/conda.sh
ln -s $BASEDIR/zshrcd/wsl.sh ~/.zshrcd/wsl.sh
ln -s $BASEDIR/zshrcd/zoxide.sh ~/.zshrcd/zoxide.sh
ln -s $BASEDIR/zshrcd/init/_settings.sh ~/.zshrcd/init/_settings.sh
[[ ! -f $BASEDIR/zshrcd/init/settings.sh ]] || ln -s $BASEDIR/zshrcd/init/settings.sh ~/.zshrcd/init/settings.sh

ln -s $BASEDIR/p10k.zsh ~/.p10k.zsh

ln -s $BASEDIR/tmux.conf ~/.tmux.conf 

ln -s $BASEDIR/gitconfig ~/.gitconfig

