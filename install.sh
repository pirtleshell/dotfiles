#!/bin/sh

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# symlink entire dotfiles dir
if [ ! -e ~/.dotfiles ]; then
  echo linking .dotfiles directory
  ln -s $DOTDIR ~/.dotfiles
else
  echo '~/.dotfiles exists'
fi

${DOTDIR}/cleanup.sh


function home_link() {
  echo '  linking' $1
  ln -s ${DOTDIR}/home/$1 ~/$1
}

# universal aliases setup
home_link .aliases

case "$SHELL" in
  *zsh)
    # zsh-specific files
    echo zsh in use, linking relevant files
    home_link .zprofile
    ;;
  *bash)
    # bash-specific files
    echo bash in use, linking relevant files
    home_link .bash_profile
    home_link .bash_prompt
esac

# git
home_link .gitconfig
