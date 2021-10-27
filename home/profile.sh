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
export GOPATH="$HOME/go"
export PATH="$GOPATH:$PATH:/usr/local/go/bin"


#################################################
# misc
#################################################

### Docker ###
# fast & pretty docker
# https://www.docker.com/blog/solving-docker-compose-performance-on-macos-catalina/
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

### GPG ###
# the following allows you to use GPG for SSH
gpg_restart() {
    killall gpg-agent
    gpg-agent --daemon --enable-ssh-support > /dev/null 2>&1
}
if hash gpg 2>/dev/null; then
    GPG_TTY=$TTY
    SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
    SSH_AGENT_PID=""
    export GPG_TTY SSH_AUTH_SOCK SSH_AGENT_PID
    gpg_restart

    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi

# Clean up all your crufty containers
function docker-clean {
    yes | docker system prune
    yes | docker system prune --volumes
}

### asdf Tool Version Manager ###
# http://asdf-vm.com/guide/getting-started.html
source_if_exists /usr/local/opt/asdf/libexec/asdf.sh

### Nodenv setup ###
if hash nodenv 2>/dev/null; then
    eval "$(nodenv init -)"
fi

####
# Support local machine overrides for anything!
####
source_if_exists ~/.localrc
