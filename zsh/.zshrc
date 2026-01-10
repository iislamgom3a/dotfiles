# --- source zsh custom files ---#
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/home/iislamgom3a/.opencode/bin:$PATH
export PATH=/home/iislamgom3a/work/pdconv/target/debug/pdconv:$PATH
export PATH="$HOME/work/pdconv/target/debug:$PATH"

export PATH=$HOME/.local/bin:$PATH

# tuitube
export PATH=/home/iislamgom3a/.termcast/compiled/tuitube/bin:$PATH
