export GOPATH="$HOME/go"
export PATH=$PATH:$(go env GOPATH)/bin
export GO111MODULE=on
export GOPROXY=direct
export GOSUMDB=off

export FIREBASE_CREDENTIALS=~/path_to_file/firebase_adminsdk_service_account_test.json

export PATH=$PATH:/Users/s08721/.nodebrew/current/bin

export PATH=/usr/local/Cellar/vim/8.2.0750/bin:$PATH

complete -C /usr/local/bin/terraform terraform

alias ls='ls -G'

stty stop undef
stty start undef
