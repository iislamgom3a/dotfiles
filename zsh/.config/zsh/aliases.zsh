#--- eza ---#
alias ls='eza --icons'
alias ll='eza -al --icons'
alias lt='eza -T --level 2 --icons'

# --- git  ---#
alias lg='lazygit'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
gsync (){
  git add .
  git commit -m "sync" 
  git push
}

alias ldo='lazydocker'
alias ff='fastfetch'

#--- neovim  ---#
alias e='nvim'
alias v='nvim'
alias vim='nvim'

#--- system ---#
alias sleep='systemctl suspend -i'
alias shutdown='sudo shutdown now'
alias cl='clear'
alias open='xdg-open'
alias ..='cd ..'

#--- tmux  ---#
alias tl='tmux ls'
tns(){
  tmux new -s $1
}

tas(){
  tmux a -t $1
}

#--- ML ---#
alias cab='source ~/anaconda3/bin/activate base'
alias jl='jupyter-lab'
alias jn='jupyter-notebook'
