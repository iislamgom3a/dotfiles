
gpp() {
    if [ -z "$1" ]; then
        echo "❌ Usage: gpp23 <file.cpp> [program args]"
        return 1
    fi

    src="$1"
    shift
    if [ ! -f "$src" ]; then
        echo "❌ File '$src' not found!"
        return 1
    fi

    exe="${src%.*}"   # Remove .cpp extension

    echo "🔧 Compiling $src → $exe"
    g++ -static -DLOCAL -lm -s -x c++ -Wall -Wextra -O2 -std=c++23 "$src" -o "$exe"

    if [ $? -eq 0 ]; then
        echo "🚀 Running ./$exe"
        "./$exe" "$@"
    else
        echo "❌ Compilation failed."
    fi
}


# Aliases 
alias ls='eza --icons'
alias ll='eza -al --icons'
alias lt='eza -T --level 2 --icons'
