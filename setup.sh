#!/usr/bin/bash

update_config() {
    target_file=$1
    source_file=$2

    [ -e "$target_file" ] && rm "$target_file"
    ln -s "$source_file" "$target_file"
}

install_tpm() {
    if [ ! -d ~/.tmux ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
}

install_neovim() {
    if [ ! -d ~/.config/nvim ]; then
        sudo apt install neovim && mkdir -p ~/.config/nvim/
    fi
}

install_tpm
install_neovim

update_config ~/.bashrc ~/configs/.bashrc
update_config ~/.bash_aliases ~/configs/.bash_aliases
update_config ~/.tmux.conf ~/configs/.tmux.conf
update_config ~/.vimrc ~/configs/.vimrc
update_config ~/.ssh/config ~/configs/ssh_config
update_config ~/.gitconfig ~/configs/.gitconfig
update_config ~/.config/nvim/init.vim ~/configs/init.vim

source ~/.bashrc
