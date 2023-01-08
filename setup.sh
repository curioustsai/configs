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
        sudo apt-get install -y software-properties-common
        sudo apt-get install -y python-software-properties
        sudo add-apt-repository ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install -y neovim && mkdir -p ~/.config/nvim/
    fi
}

install_lvim() {
    if [ ! -d ~/.config/lvim ]; then
        bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    fi
}

install_nodejs() {
    curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
}

install_python3() {
    sudo apt-get install -y python-dev python-pip python3-dev python3-pip
}

install_zsh() {
    if [ ! -d ~/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
    fi
}

wget_gdbDashboard() {
    if [ ! -f ~/.gdbinit ]; then
        wget https://github.com/cyrus-and/gdb-dashboard/blob/master/.gdbinit -O ~/.gdbinit
    fi
}

install_zsh
install_tpm
install_neovim
install_nodejs
install_python3
install_lvim

# update_config ~/.bashrc ~/configs/.bashrc
# update_config ~/.bash_aliases ~/configs/.bash_aliases
update_config ~/.tmux.conf ~/configs/.tmux.conf
update_config ~/.ssh/config ~/configs/ssh_config
update_config ~/.gitconfig ~/configs/.gitconfig
update_config ~/.config/nvim/init.vim ~/configs/init.vim
update_config ~/.config/lvim/config.lua ~/configs/config.lua
update_config ~/.zshrc ~/configs/.zshrc
wget_gdbDashboard

source ~/.zshrc
