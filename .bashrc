# env
export GOPATH="$HOME/go"
export PATH=$PATH:$(go env GOPATH)/bin
export GOROOT="$HOME/.go"
export GO111MODULE=on
export GOPROXY=direct
export FIREBASE_CREDENTIALS=~/path_to_file/firebase_adminsdk_service_account_test.json
export PATH=$PATH:/Users/s08721/.nodebrew/current/bin
export PATH=$PATH:/usr/local/Cellar/vim/8.2.1150/bin
export PS1="\u \W\$ "
export ICEBERG="bg+:#1e2132,bg:#161821,spinner:#84a0c6,hl:#6b7089,fg:#c6c8d1,header:#6b7089,info:#b4be82,pointer:#84a0c6,marker:#84a0c6,fg+:#c6c8d1,prompt:#84a0c6,hl+:#84a0c6"
export BASH_SILENCE_DEPRECATION_WARNING=1
export GOPRIVATE=github.com/simply-app/sdk-go
export PATH="$PATH:$HOME/.pyenv/shims"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/.cargo/bin"
export HISTCONTROL=ignoredups 

# disable output lock
stty stop undef
stty start undef

# bash-complete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source ~/.git-completion.bash
if type terraform &> /dev/null; then
    complete -C terraform terraform
fi

# gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# starship
eval "$(starship init bash)"

# fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=$ICEBERG"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,node_modules,bazel-*,vendor} --type f"

# gcd
function gcd() {
  local repo_path=`ghq list --full-path | fzf --reverse --preview "bat --style=header,grid --line-range :100 {1}/README.md"`
  \cd ${repo_path}
}

# history
alias hl='history -a; temp=$(cat ~/.bash_history | peco); { echo "$temp" | pbcopy ; }'

# bind
bind -x '"\C-g": gcd'
bind -x '"\C-h": hl'

# alias 
alias ls='ls -G'

# pyenv
eval "$(pyenv init -)"
