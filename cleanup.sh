#!/bin/sh
# this will unlink all home files except for the ~/.dotfiles directory link

echo running cleanup script

function remove_link() {
  local _f=$HOME/$1
  if [ -L $_f ]; then
    unlink $_f
    echo '  unlinked' $1
  fi
}


FILES='
.aliases
.bash_profile
.bash_prompt
.gitconfig
.zprofile
.zsh_prompt
'
for FILE in $FILES; do remove_link $FILE; done

echo cleanup completed
