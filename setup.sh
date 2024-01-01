#!/bin/bash
# TODO: Rakefile で書き換えたい。

set -eo pipefail

DOT_FILES=(
  .zsh
  .zshrc
  .tmux.conf
  .gvimrc
  .vimrc
  .vim
  .ideavimrc
  .tmuxinator
  .gitconfig
  .pryrc
  .wezterm.lua
)

for file in ${DOT_FILES[@]}
do
    src_file=$(echo ${file} | sed 's/^\./_/')
    if [ ! -L $HOME/$file -a -f $HOME/$file ]; then
        #echo "WARN: found symlink file: $HOME/$file. can i rename to $HOME/${file}_ ?"
        read -n1 -p "WARN: found real file: '$HOME/$file'. can i rename to '$HOME/${file}_' ? [y/N]" KEY_IN
        echo
        if [ "$KEY_IN" != "Y" -a "$KEY_IN" != "y" ]; then
            continue
        fi
        mv $HOME/$file $HOME/${file}_
    fi

    ln -snf $HOME/dotfiles/$src_file $HOME/$file
    echo symlink created: $HOME/$file
done

# AstroNvim
(cd ~/dotfiles; git submodule init)
ln -sf ~/.config/nvim ~/dotfiles/AstroNvim

# neovimとvimの共存用設定
#mkdir -p ~/.config
#ln -sf ~/.vimrc ~/.config/nvim/init.vim

# neovimとvimの共存用設定
mkdir -p ~/.config
ln -sf ~/.vim ~/.config/nvim

