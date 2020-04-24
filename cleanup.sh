#!/bin/sh
# this will unlink all home files except for the ~/.dotfiles directory link

echo running cleanup script

function remove_home_link() {
  local _f=$HOME/$1
  if [ -L $_f ]; then
    unlink $_f
    echo '  unlinked' $1
  elif [ -f $_f ]; then
    echo '  *** non-symlinked file exists:' $1 '***'
  fi
}

# home files
FILES='
.aliases
.bash_profile
.bash_prompt
.gitconfig
.zshrc
.zsh_prompt
'
for FILE in $FILES; do remove_home_link $FILE; done


# vscode settings
if [ -d ~/Library/Application\ Support/Code/User/ ]; then

  if [ -f ~/Library/Application\ Support/Code/User/settings.json ]; then
    echo '  vscode settings is unlniked file! not overriding.'
  elif [ -L ~/Library/Application\ Support/Code/User/settings.json ]; then
    echo '  unlinked vscode settings.json'
  fi

else
  echo '  vscode not found. settings not unlinked.'
fi

echo cleanup completed
