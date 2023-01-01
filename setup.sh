#!/bin/bash

DOT_FILES=(.hammerspoon .vim bin .bash_profile .bashrc .crkbd.json .tmux.conf .vimrc)

for file in ${DOT_FILES[@]}
do
    ln -s ./$file $HOME/$file
done
