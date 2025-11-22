#!/bin/bash

echo "--- Updating DNF and installing required packages ---"
sudo dnf update -y
sudo dnf copr enable alternateved/eza -y 
sudo dnf copr enable dejan/lazygit -y
sudo dnf copr enable atim/starship -y 
sudo dnf install -y \
    zsh \
    neovim \
    git \
    eza \
    fastfetch \
	lazygit \
	starship \
	code \
	tmux \

# Check if Zsh is the default shell
if [[ "$SHELL" != "/bin/zsh" ]]; then
    echo "--- Changing default shell to Zsh ---"
    chsh -s $(which zsh)
    echo "Please log out and log back in for the shell change to take effect."
fi

# Install tmux plugin manager
source ./tmux/.config/tmux/install_plugin_manager.sh

stow lazygit nvim starship tmux zsh 

echo "Dotfiles Installed... Don't forget to login again..."
