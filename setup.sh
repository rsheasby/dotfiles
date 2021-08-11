#!/bin/bash

## Setup neovim
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backupdir

## Setup Lazygit
mkdir -p ~/Library/Application Support/jesseduffield/

## Link dotfiles directories
CWD=$(pwd)
ln -s $CWD/neovim ~/.config/nvim
ln -s $CWD/doom-emacs ~/.doom.d
ln -s $CWD/lazygit ~/Library/Application\ Support/jesseduffield/lazygit
