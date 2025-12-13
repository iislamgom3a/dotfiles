# eza
alias ls='eza --icons'
alias ll='eza -al --icons'
alias lt='eza -T --level 2 --icons'

alias lg='lazygit'

# neovim 
alias e='nvim'
alias v='nvim'
alias vim='nvim'

alias sl='systemctl suspend -i'

# tmux new session
tns(){
  tmux new -s $1
}

# tmux attach session
tas(){
  tmux a -t $1
}
