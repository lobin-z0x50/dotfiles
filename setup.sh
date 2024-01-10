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
function config_astro_nvim() {
    if [ -e ~/.config/nvim ]; then
        return 0
    fi

    read -n1 -p "AstroNvim のコンフィグをインストールしますか？ [y/N]" KEY_IN
    echo
    if [ "$KEY_IN" != "Y" -a "$KEY_IN" != "y" ]; then
        return 1
    fi

    (cd ~/dotfiles; git submodule update -i)
    mkdir -p ~/.config
    ln -sf ~/dotfiles/AstroNvim ~/.config/nvim
    echo "config installed for AstroNvim in ~/.config/nvim"
}

function install_nvim() {
    if which nvim; then
        return 0
    fi

    read -n1 -p "NVIM をインストールしますか？ [y/N]" KEY_IN
    echo
    if [ "$KEY_IN" != "Y" -a "$KEY_IN" != "y" ]; then
        return 1
    fi

    echo "installing nvim (from universal app image)..."

    # NVIM 最新版をインストール
    # https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod +x nvim.appimage
    if [ $1 = 'GLOBAL' ]; then
        sudo mv ./nvim.appimage /usr/local/bin/
        sudo ln -s /usr/local/bin/nvim.appimage /usr/bin/nvim
    else
        mkdir -p ~/bin
        mv ./nvim.appimage ~/bin/nvim
    fi
    which nvim
}


# neovimとvimの共存用設定
#mkdir -p ~/.config
#ln -sf ~/.vim ~/.config/nvim

install_nvim 'GLOBAL'
config_astro_nvim

