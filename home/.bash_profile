# If not running interactively, don't do anything
[ -z "$PS1" ] && return

###
# bash history
###
shopt -s histappend      # append, don't override
HISTCONTROL=ignoreboth   # ignore duplicate commands and those beginning with a space
HISTSIZE=1000
HISTFILESIZE=2000


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

###
# colors 'cause we fancy
###
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


###
# pirtle's proverbial prompt
###
# [user@server:dir]$
PS1='[\u@\h:\w]$ '


###
# aliases live in .aliases
###
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi