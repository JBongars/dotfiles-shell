# ___________            
# \_   _____/ _______  __
#  |    __)_ /    \  \/ /
#  |        \   |  \   / 
# /_______  /___|  /\_/  
#         \/     \/      

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# config locale string for perl
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Editor
export EDITOR="$(command -v nvim || command -v vim || command -v vi)"

# Pager
if command -v bat &>/dev/null; then
    export PAGER="bat --paging=always --style=plain"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
else
    export PAGER="less"
    export MANPAGER="less"
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S"
