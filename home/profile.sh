#!/bin/sh
# profile stuff shared between bash and zsh

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
