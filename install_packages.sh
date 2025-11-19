#!/bin/bash

echo "--- Updating DNF and installing required packages ---"
sudo dnf update -y
sudo dnf copr enable alternateved/eza # add eza repo 
sudo dnf install -y \
    zsh \
    neovim \
    git \
    libXScrnSaver \
    htop \
    eza \
    fastfetch \
    curl \

# Check if Zsh is the default shell
if [[ "$SHELL" != "/bin/zsh" ]]; then
    echo "--- Changing default shell to Zsh ---"
    chsh -s $(which zsh)
    echo "Please log out and log back in for the shell change to take effect."
fi

echo "You can now run 'stow zsh', 'stow git', and 'stow nvim' from the dotfiles root directory."
