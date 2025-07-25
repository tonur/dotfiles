#!/usr/bin/env zsh

if [[ -v WSL_DISTRO_NAME ]]; then
  export GTK_THEME=Adwaita:dark
  export BROWSER=${HOME}/.local/bin/wsl_openlink.sh
  export XDG_CACHE_HOME=${HOME}/.cache
  export XDG_CONFIG_HOME=${HOME}/.config
  export XDG_DATA_HOME=${HOME}/.local/share
  export XDG_SESSION_TYPE=wayland

  source $ZDOTDIR/env.sh
  source $ZDOTDIR/15.clean-home-dir.sh

  # Temp fix as GUI are broken
  export LIBGL_ALWAYS_SOFTWARE=1
  export __GLX_VENDOR_LIBRARY_NAME=mesa
fi
