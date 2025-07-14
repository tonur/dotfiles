#!/usr/bin/env bash

# Alias
# Fix that alias k="kubectl" is not completed
unsetopt completealiases

# Space before so they are not added to history
if [[ $PLATFORM == 'Darwin' ]]; then
  alias ls=' ls -Fh'
  alias ll=' ls -lFh'
else
  alias ls=' ls -Fh --color=auto'
  alias ll=' ls -lFh --color=auto'
fi
alias l=' ll'
alias lA=' ll -A'
alias lln=' ls -lFAt | head' # sort after last modified

if [[ $PLATFORM != 'Darwin' ]]; then
  alias chmod='chmod -c' #-c like verbose but report only when a change is made
fi

alias cd-="cd -"
alias cd.='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias cd6='cd ../../../../../..'

alias recall='history | grep'

alias open='xdg-open'

# Vim / NeoVim
if [[ -L /bin/view ]]; then
  alias view="vim -R"
fi
#!/usr/bin/env bash
if [[ -e /usr/bin/nvim ]]; then
  alias vim='nvim'
  alias vimdiff='nvim -d'
  alias view='nvim -R'
  if [[ -e /usr/bin/nvr ]]; then
    alias :e='nvr --remote-silent'
  fi
fi

alias df=" df"
alias view-="view -"

alias useradd="adduser"

if [[ -e /usr/bin/python3 ]]; then
  alias webshare='python3 -m http.server'
fi

if [[ -e '/usr/bin/htop' ]]; then
  alias top="htop"
fi

alias dh1="du -h --max-depth=1"
# Inspired by https://gist.github.com/thebouv/8657674
# -s summerize
# -h human readable
# -x one file system
alias ducks="du -shx * | sort -hr | head"

###################################################
# K8S aliases
#
alias k=kubectl
alias kgetrestart="kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'"
alias kgetevent="kubectl get events --sort-by=.metadata.creationTimestamp"
alias kgeteventw="kubectl get events --sort-by=.metadata.creationTimestamp -w"
