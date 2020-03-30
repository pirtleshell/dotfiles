#!/bin/sh
# this will unlink all home files except for the ~/.dotfiles directory link

echo running cleanup script

function remove_link() {
  if [ -L $1 ]; then
    unlink $1
    echo '  unlinked' $1
  fi
}


FILES='
.aliases
.bash_profile
.bash_prompt
.gitconfig
.zprofile
'
for FILE in $FILES; do remove_link $FILE; done

echo cleanup completed
