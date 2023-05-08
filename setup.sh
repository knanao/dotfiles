#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

DOT_FILES=(.bash_profile .bashrc .crkbd.json .tmux.conf .vimrc .git-completion.bash starship.toml)

for file in ${DOT_FILES[@]}
do
  ln -sf $PWD/$file $HOME/$file
done

ls -s .hammerspoon $HOME/.hammerspoon
ls -s bin $HOME/bin

brew bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

curl -o $HOME -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors
