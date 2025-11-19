# Binds Ctrl+H (or Backspace) to delete the previous word.
bindkey '^H' backward-kill-word



# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"


