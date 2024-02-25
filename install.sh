#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="bin,nvim,zsh"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS 
DOTFILES=$DOTFILES 

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done
popd

