#--- eza ---#
alias ls='eza --icons'
alias ll='eza -al --icons'

lt(){
  if [ $# -eq 0 ]; then 
    eza -T --level 2 --icons
  else
    eza -T --level $1 --icons
  fi 
}

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


alias cd='z'
alias cdi='zi'
alias cmt='cmatrix'

# competitive programming
contest(){
  local dir_name=$1
  local no_of_files=$2
  local letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  mkdir "$dir_name"
  for i in $(seq 1 $(($no_of_files))); do
    touch "$dir_name/${letters[$i]}.cpp"
  done
}

cpp(){
  local file=$1
  local name="${file%.*}"
  g++ -o "$name" "$file" -O2 -std=c++17 -Wall -Wextra
  ./"$name" < in.txt

}

