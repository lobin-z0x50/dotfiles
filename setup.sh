#!/bin/bash

DOT_FILES=(
  .zshrc
  .tmux.conf
  .gvimrc
  .vimrc
  .vim
  .tmuxinator
  .gitconfig
  .pryrc
)

for file in ${DOT_FILES[@]}
do
  src_file=$(echo ${file} | sed 's/^\./_/')
  if [ ! -L $HOME/$file -a -f $HOME/$file ]; then
    echo "WARN: found no symlink file: $HOME/$file. rename to $HOME/${file}_"
    mv $HOME/$file $HOME/${file}_
  fi

  ln -snf $HOME/dotfiles/$src_file $HOME/$file
done

# neovimとvimの共存用設定
#mkdir -p ~/.config
#ln -sf ~/.vimrc ~/.config/nvim/init.vim

# neovimとvimの共存用設定
mkdir -p ~/.config
ln -sf ~/.vim ~/.config/nvim
