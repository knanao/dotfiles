if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/s08721/google-cloud-sdk/path.bash.inc' ]; then . '/Users/s08721/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/s08721/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/s08721/google-cloud-sdk/completion.bash.inc'; fi

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
