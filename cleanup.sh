#!/bin/sh
# this will unlink all home files except for the ~/.dotfiles directory link

echo running cleanup script

remove_home_link () {
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
.config/git
.config/starship.toml
.tool-versions
.zshrc
.zsh_prompt
'
for FILE in $FILES; do remove_home_link $FILE; done

echo cleanup completed
