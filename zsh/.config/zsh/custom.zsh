#--- zsh history settings ---#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

#--- better history management for autosuggestions ---#
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY  # write history immediately
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


#--- Starship ---# 
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

#--- zsh autosuggestions and syntax highlighting ----
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export EDITOR="nvim"
export VISUAL="nvim"

# editor buffer
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
