# fedora packages
sudo dnf update -y
sudo dnf copr enable alternateved/eza -y
sudo dnf copr enable dejan/lazygit -y
sudo dnf install -y zsh neovim git eza fastfetch lazygit tmux stow

# starship
curl -sS https://starship.rs/install.sh | sh

# zsh (rememver to logout and login again)
chsh -s $(which zsh)

# mtux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# autosuggestions and syntax highlighting for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# apply configurations
stow lazygit nvim starship tmux zsh zed
