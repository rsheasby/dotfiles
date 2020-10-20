#!/usr/bin/bash

## Link dotfiles directories
CWD=$(pwd)
ln -s $CWD/neovim ~/.config/nvim
ln -s $CWD/doom-emacs ~/.doom.d

## Setup neovim
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backupdir
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
mkdir -p ~/.fonts

## Install Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

## Configure git
git config --global user.name 'Ryan David Sheasby'
git config --global user.email 'ryan@sheasby.dev'
