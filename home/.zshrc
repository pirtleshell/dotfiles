#!/usr/bin/env zsh
# it's likely that some stuff will be stolen from @ohmyzsh/ohmyzsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.dotfiles/home/profile.sh ]; then
    . ~/.dotfiles/home/profile.sh
fi


#################################################
# zsh history
#################################################
export HISTFILE=~/.history
export HISTSIZE=50000
export HISTFILESIZE=100000
export SAVEHIST=$HISTSIZE

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data


#################################################
# prompt
#################################################
if [ -f ~/.zsh_prompt ]; then
    . ~/.zsh_prompt
fi


#################################################
# tab completion
#################################################
setopt noautomenu
setopt bashautolist

# git completion
if [ -f ~/.dotfiles/etc/git-completion.zsh ]; then
    . ~/.dotfiles/etc/git-completion.sh > /dev/null 2>&1
    zstyle ':completion:*:*:git:*' script ~/.dotfiles/etc/git-completion.zsh
fi

# kubernetes
if hash kubectl 2>/dev/null; then
    source <(kubectl completion zsh)
fi
if hash helm 2>/dev/null; then
    source <(helm completion zsh)
fi


#################################################
# some keybindings
#################################################
# fn-delete for forward delete
bindkey "^[[3~" delete-char
