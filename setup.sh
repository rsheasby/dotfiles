#!/bin/bash

if test -f "/etc/debian_version"; then
  echo "Debian-like system detected. Attempting to install required tools:"
  sudo apt update && sudo apt install curl wget fish neovim-qt git docker.io nodejs golang -y
  sudo chsh -s $(which fish)
fi

curl -L https://oh-my.fish -o install.fish
fish install.fish --noninteractive
rm install.fish
echo 'omf install agnoster' | fish

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

## Install Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

## Configure git
git config --global user.name 'Ryan David Sheasby'
git config --global user.email 'ryan@sheasby.dev'
