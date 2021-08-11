#!/bin/bash

## Setup neovim
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backupdir

## Setup Lazygit
mkdir -p ~/Library/Application\ Support/jesseduffield/

## Delete existing symlinks if they exist
rm -f ~/.config/nvim
rm -f ~/.doom.d
rm -f ~/Library/Application\ Support/jesseduffield/lazygit

## Link dotfiles directories
CWD=$(pwd)
ln -s $CWD/neovim ~/.config/nvim
ln -s $CWD/doom-emacs ~/.doom.d
ln -s $CWD/lazygit ~/Library/Application\ Support/jesseduffield/lazygit
