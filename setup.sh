 #!/bin/bash

 DOT_FILES=(.vim .bash_profile .bashrc)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/go/src/github.com/knanao/dotfiles/$file $HOME/$file
 done
