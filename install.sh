#!/usr/bin/env bash

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# bash setup
ln -s ${DOTDIR}/home/.bash_profile ~/.bash_profile
ln -s ${DOTDIR}/home/.bash_prompt ~/.bash_prompt
ln -s ${DOTDIR}/home/.aliases ~/.aliases

# git
ln -s ${DOTDIR}/home/.gitconfig ~/.gitconfig
