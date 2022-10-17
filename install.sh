#!/bin/sh

DOTDIR="$(cd "$(dirname "$0")" && pwd)"

# symlink entire dotfiles dir
if [ ! -e ~/.dotfiles ]; then
  echo linking .dotfiles directory
  ln -s $DOTDIR ~/.dotfiles
else
  echo '~/.dotfiles exists'
fi

${DOTDIR}/cleanup.sh


home_link () {
  echo '  linking' $1
  ln -s ${DOTDIR}/home/$1 ~/$1
}

# universal aliases setup
home_link .aliases

case "$SHELL" in
  *zsh)
    # zsh-specific files
    echo zsh in use, linking relevant files
    home_link .zshrc
    home_link .zsh_prompt
    ;;
  *bash)
    # bash-specific files
    echo bash in use, linking relevant files
    home_link .bash_profile
    home_link .bash_prompt
esac

# git
home_link .gitconfig

# vscode settings
if [ -d ~/Library/Application\ Support/Code/User/ ]; then
  echo '  linking vscode settings.json'
  ln -s $DOTDIR/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi
