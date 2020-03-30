#!/usr/bin/env bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.dotfiles/home/profile.sh ]; then
    . ~/.dotfiles/home/profile.sh
fi

#################################################
# bash history
#################################################
shopt -s histappend      # append, don't override
HISTCONTROL=ignoreboth   # ignore duplicate commands and those beginning with a space
HISTSIZE=50000
HISTFILESIZE=100000


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


#################################################
# prompt
#################################################
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi


#################################################
# tab completion
#################################################
if [ -f ~/.dotfiles/etc/git-completion.sh ]; then
    . ~/.dotfiles/etc/git-completion.sh
fi
