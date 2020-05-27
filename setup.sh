 #!/bin/bash

 DOT_FILES=(.bashrc .bash_profile .vim .vimrc .hammerspoon)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/go/src/github.com/knanao/dotfiles/$file $HOME/$file
 done
