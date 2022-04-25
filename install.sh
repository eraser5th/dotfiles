#!/usr/bin/env bash

set -u

BASEDIR=$(dirname $0)
cd $BASEDIR

pwd

ln -snfv ${PWD}/.vimrc ~/
ln -snfv ${PWD}/.zshrc ~/
ln -snfv ${PWD}/vim ~/
ln -snfv ${PWD}/.clang-format ~/
ln -snfv ${PWD}/.config/nvim ~/.config/
ln -snfv ${PWD}/.config/karabiner ~/.config/
