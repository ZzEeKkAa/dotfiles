#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

mv ~/.zshrc ~/.zshrc.bak
ln -s $BASEDIR/zshrc ~/.zshrc
mkdir -p ~/.zshrcd/init
ln -s $BASEDIR/zshrcd/conda.sh ~/.zshrcd/conda.sh
if [  -n "$(uname -r | grep WSL)" ]; then
    ln -s $BASEDIR/zshrcd/wsl.sh ~/.zshrcd/wsl.sh
fi
if [  -n "$(uname -a | grep Darwin)" ]; then
    ln -s $BASEDIR/zshrcd/grep-mac.sh ~/.zshrcd/grep.sh
fi
ln -s $BASEDIR/zshrcd/zoxide.sh ~/.zshrcd/zoxide.sh
ln -s $BASEDIR/zshrcd/init/_settings.sh ~/.zshrcd/init/_settings.sh
[[ ! -f $BASEDIR/zshrcd/init/settings.sh ]] || ln -s $BASEDIR/zshrcd/init/settings.sh ~/.zshrcd/init/settings.sh

ln -s $BASEDIR/p10k.zsh ~/.p10k.zsh

ln -s $BASEDIR/tmux.conf ~/.tmux.conf 

ln -s $BASEDIR/gitconfig ~/.gitconfig

cat $BASEDIR/condarc > ~/.condarc

