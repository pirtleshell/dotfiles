#!/bin/sh
# profile stuff shared between bash and zsh

source_if_exists () {
    [ -s "$1" ] && \. "$1"
}

#################################################
# colors 'cause we fancy
#################################################
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


#################################################
# aliases live in .aliases
#################################################
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# quick jump around with z.sh, but it's called j! for JUMP!
# see etc/z.sh
export _Z_CMD='j'
source_if_exists "$HOME/.dotfiles/etc/z.sh"

#################################################
# path magic
#################################################
# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# rust
export PATH="$HOME/.cargo/bin:$PATH"
# go
export PATH="$HOME/go/bin:$PATH:/usr/local/go/bin"


#################################################
# misc
#################################################

### Docker ###
# fast & pretty docker
# https://www.docker.com/blog/solving-docker-compose-performance-on-macos-catalina/
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Clean up all your crufty containers
function docker-clean {
    yes | docker system prune
    yes | docker system prune --volumes
}

### Node Version Manager ###
export NVM_DIR="$HOME/.nvm"
source_if_exists "$NVM_DIR/nvm.sh"
source_if_exists "$NVM_DIR/bash_completion"

### Nodenv setup ###
if hash nodenv 2>/dev/null; then
    eval "$(nodenv init -)"
fi
