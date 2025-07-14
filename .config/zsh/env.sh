#!/usr/bin/env bash

# Env's

############################################
# Bat
#
if [[ -e /usr/sbin/bat ]]; then
  export BAT_PAGER="less -RF"
  export PAGER=$BAT_PAGER
  export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
fi

############################################
# SystemD / JournalD
# https://wiki.archlinux.org/index.php/Journalctl#Journal
# By omitting the S option, the output will be wrapped instead of truncated.
export SYSTEMD_LESS=FRXMK

############################################
# Path setup
if [[ -d ${HOME}/bin ]]; then
  PATH=${PATH}:${HOME}/bin
fi

# NodeJS
if [[ -d ${HOME}/.local/nodejs/bin ]]; then
  PATH=${PATH}:${HOME}/.local/nodejs/bin
fi

# Packages installed by pip and others
if [[ -d ${HOME}/.local/bin ]]; then
  PATH=${PATH}:${HOME}/.local/bin
fi

# krew - kubectl plugin manager
if [[ -d ${HOME}/.krew/bin ]]; then
  PATH=${PATH}:${HOME}/.krew/bin
fi

export PATH
