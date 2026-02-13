#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
  echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
  echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_package() {
  if ! command_exists "$1"; then
    print_status "Installing $1..."
    sudo dnf install -y "$1"
    print_success "$1 installed successfully"
  else
    print_warning "$1 is already installed"
  fi
}

main() {
  print_status "Starting Fedora development environment setup..."

  print_status "Updating system packages..."
  sudo dnf update -y

  print_status "Enabling COPR repositories..."
  sudo dnf copr enable alternateved/eza -y
  sudo dnf copr enable dejan/lazygit -y
  sudo dnf copr enable scottames/ghostty -y

  print_status "Installing core development packages..."
  packages=(
    "neovim"
    "zed"
    "zsh"
    "eza"
    "fastfetch"
    "lazygit"
    "tmux"
    "stow"
    "btop"
    "gh"
    "fzf"
    "ghostty"
    "zoxide"
    "dust"
  )

  for package in "${packages[@]}"; do
    install_package "$package"
  done

  if ! command_exists "starship"; then
    print_status "Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    print_success "Starship prompt installed"
  else
    print_warning "Starship is already installed"
  fi

  if [[ "$SHELL" != *"zsh"* ]]; then
    print_status "Changing default shell to zsh..."
    chsh -s $(which zsh)
    print_success "Default shell changed to zsh"
    print_warning "You will need to logout and login again for changes to take effect"
  else
    print_warning "zsh is already the default shell"
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
  else
    print_warning "Oh My Zsh is already installed"
  fi

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    print_status "Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    print_success "tmux plugin manager installed"
  else
    print_warning "tmux plugin manager is already installed"
  fi

  ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    print_status "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
    print_success "zsh-autosuggestions installed"
  else
    print_warning "zsh-autosuggestions is already installed"
  fi

  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    print_status "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
    print_success "zsh-syntax-highlighting installed"
  else
    print_warning "zsh-syntax-highlighting is already installed"
  fi

  print_status "Applying dotfiles configurations..."

  config_dirs=(
    "lazygit"
    "nvim"
    "starship"
    "tmux"
    "zsh"
    "zed"
    "ghostty"
  )

  for config in "${config_dirs[@]}"; do
    if [ -d "$config" ]; then
      print_status "Stowing $config configuration..."
      stow "$config"
      print_success "$config configuration applied"
    else
      print_warning "Configuration directory '$config' not found, skipping..."
    fi
  done

  print_success "Installation completed successfully!"
  echo
  print_status "Next steps:"
  echo "1. Logout and login again to use zsh as your default shell"
  echo "2. Open tmux and press 'Ctrl + space' then 'I' to install tmux plugins"
}

main "$@"
