#!/usr/bin/env bash

function error() {
  local RESET="\\033[0;39m"
  local RED="\\033[1;31m"
  echo -n "${RED}$1${RESET}"
}

function notice() {
  local RESET="\\033[0;39m"
  local GREEN="\\033[1;32m"
  echo -n "${GREEN}$1${RESET}"
}

function x {
  for archive in "${@}"; do
    if [ -f "$archive" ]; then
      # cspell:disable
      case $archive in
      *.tar.bz2) tar xvjf "$archive" ;;
      *.tar.gz) tar xvzf "$archive" ;;
      *.tar.xz) tar xvJf "$archive" ;;
      *.tar.zst) tar --zstd -xvf "$archive" ;;
      *.bz2) bunzip2 "$archive" ;;
      *.rar) unrar x "$archive" ;;
      *.gz) gunzip "$archive" ;;
      *.tar) tar xvf "$archive" ;;
      *.tbz2) tar xvjf "$archive" ;;
      *.tgz) tar xvzf "$archive" ;;
      *.ezpkg) tar zxvf "$archive" ;;
      *.7z) 7z x "$archive" ;;
      *.xz) unxz "$archive" ;;
      *.deb) ar vx "$archive" ;;
      *.zip)
        DIRNAME1=$(echo "$archive" | tr ' ' '_')
        DIRNAME=$(basename "${DIRNAME1}" .zip)
        echo "Creating '${DIRNAME}', and moving '$archive' to it"
        mkdir "$DIRNAME"
        mv "$archive" "$DIRNAME/"
        cd "$DIRNAME" || exit
        unzip "$archive"
        ;;
      *.Z) uncompress "$archive" ;;
      *.rpm) rpmextract.sh "$archive" ;;
      *) echo "'$archive' cannot be extracted via extract()" ;;
      esac
      # cspell:enable
    else
      echo "'$archive' is not a valid file"
      return 1
    fi
  done
}
