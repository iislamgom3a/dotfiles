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
alias gg='git log --oneline --graph --decorate --all'


alias cab='source ~/anaconda3/bin/activate base'
alias gl='git log'
alias gll='git log --oneline'
alias gd='git diff'

gsync (){
  git add .
  git commit -m "sync" 
  git push
}


#--- neovim  ---#
alias e='nvim'
alias v='nvim'

#--- system ---#
alias sleep='systemctl suspend -i'
alias shutdown='sudo shutdown now'
alias open='xdg-open'
alias ..='cd ..'

#--- tmux  ---#
alias t='tmux attach || tmux new -s Work'


#--- ML ---#
# alias cab='source ~/anaconda3/bin/activate base'
alias jl='jupyter-lab'
alias jn='jupyter-notebook'


#---  competitive programming ---#
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

#--- Others ---#
alias cd='z'
alias cdi='zi'
alias cmt='cmatrix'
alias d='lazydocker'
alias ff='fastfetch'
alias cat='batcat'
alias win11='docker compose -f /home/iislamgom3a/work/docker-files/win_11.yml up'
