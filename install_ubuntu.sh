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
  local cmd="$1"
  local pkg="${2:-$1}"

  if ! command_exists "$cmd"; then
    print_status "Installing $pkg..."
    if sudo apt-get install -y "$pkg"; then
      print_success "$pkg installed successfully"
    else
      print_warning "Failed to install $pkg via apt, skipping..."
    fi
  else
    print_warning "$cmd is already installed"
  fi
}

main() {
  print_status "Starting Ubuntu (25) development environment setup..."

  print_status "Updating system packages..."
  sudo apt-get update
  sudo apt-get upgrade -y

  print_status "Installing core development packages..."

  # Map command -> apt package (if different)
  declare -A packages=(
    [neovim]=neovim
    [zed]=zed
    [zsh]=zsh
    [eza]=eza
    [fastfetch]=fastfetch
    [lazygit]=lazygit
    [tmux]=tmux
    [stow]=stow
    [btop]=btop
    [gh]=gh
    [fzf]=fzf
    [ghostty]=ghostty
    [zoxide]=zoxide
    [dust]=dust
  )

  for cmd in "${!packages[@]}"; do
    install_package "$cmd" "${packages[$cmd]}"
  done

  # If eza wasn't installed via apt, add the upstream deb repo and install it.
  if ! command_exists "eza"; then
    print_status "Attempting to install 'eza' from deb.gierens.de repository..."
    install_package gpg
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg || print_warning "Failed to fetch or dearmor the eza GPG key"
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list || true
    sudo apt-get update
    if sudo apt-get install -y eza; then
      print_success "eza installed successfully from deb.gierens.de"
    else
      print_warning "Failed to install eza from deb.gierens.de; it may not be available for this release"
    fi
  else
    print_warning "eza is already installed"
  fi

  if ! command_exists "starship"; then
    print_status "Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    print_success "Starship prompt installed"
  else
    print_warning "Starship is already installed"
  fi

  if ! command_exists "lazydocker"; then
    print_status "Installing lazydocker prompt..."
    curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
    print_success "lazydocker installed"
  else
    print_warning "lazydocker is already installed"
  fi

  if [[ "$SHELL" != *"zsh"* ]]; then
    print_status "Changing default shell to zsh..."
    chsh -s $(which zsh) || print_warning "chsh failed; you may need to run it manually"
    print_success "Default shell set to zsh (may require logout/login)"
    print_warning "You will need to logout and login again for changes to take effect"
  else
    print_warning "zsh is already the default shell"
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || print_warning "Oh My Zsh installer failed"
    print_success "Oh My Zsh installed"
  else
    print_warning "Oh My Zsh is already installed"
  fi

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    print_status "Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || print_warning "Failed to clone tpm"
    print_success "tmux plugin manager installed"
  else
    print_warning "tmux plugin manager is already installed"
  fi

  ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    print_status "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions || print_warning "Failed to clone zsh-autosuggestions"
    print_success "zsh-autosuggestions installed"
  else
    print_warning "zsh-autosuggestions is already installed"
  fi

  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    print_status "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting || print_warning "Failed to clone zsh-syntax-highlighting"
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
      stow "$config" || print_warning "stow failed for $config"
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
