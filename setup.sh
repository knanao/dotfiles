#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

DOT_FILES=(.hammerspoon bin .bash_profile .bashrc .crkbd.json .tmux.conf .vimrc .git-completion.bash starship.toml iterm2.plist)

for file in ${DOT_FILES[@]}
do
    ln -sf $PWD/$file $HOME/$file
done

brew bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors
