#!/bin/sh

git clone git@github.com:tonur/dotfiles.git ~/.config/dotfiles
~/.config/dotfiles/install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install zsh and python
brew install zsh python@3.13

chsh -s "$(which zsh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
