#
#                                                                  _..._     
#                                                               .-'_..._''.  
#        /|                               .                   .' .'      '.\ 
#        ||                             .'|                  / .'            
#        ||                            <  |         .-,.--. . '              
#        ||  __        __               | |         |  .-. || |              
#        ||/'__ '.  .:--.'.         _   | | .'''-.  | |  | || |              
#        |:/`  '. '/ |   \ |      .' |  | |/.'''. \ | |  | |. '              
#  ,.--. ||     | |`" __ | |     .   | /|  /    | | | |  '-  \ '.          . 
# //    \||\    / ' .'.''| |   .'.'| |//| |     | | | |       '. `._____.-'/ 
# \\    /|/\'..' / / /   | |_.'.'.-'  / | |     | | | |         `-.______ /  
#  `'--' '  `'-'`  \ \._,\ '/.'   \_.'  | '.    | '.|_|                  `   
#                   `--'  `"            '---'   '---'                        
                                                                           
#
# ~/.bashrc (agnostic)
#
# GENERATED AUTOMATICALLY - DO NOT EDIT
# ══════════════════════════════════════════════════


# /home/julien/.config/shell/src/bashrc/unified/100-environment.sh
# ──────────────────────────────────────────────────

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

# /home/julien/.config/shell/src/bashrc/macos/101-environment.sh
# ──────────────────────────────────────────────────

# export brew in path
export PATH="$PATH:/opt/homebrew/bin"

# export xcode binaries to path
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin"

# brew linked files
export PATH="$PATH:/opt/homebrew/opt/openjdk/bin"
export PATH="$PATH:/opt/homebrew/opt/openjdk@11/bin"

# override newer bsah to replace mac bash
export PATH="/opt/bin/bash:$PATH"

# export PATH="$PATH:/opt/homebrew/Caskroom/powershell/7.5.2"

# android stuff
function init_android(){
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/emulator
}

# Postgres
PATH="/opt/homebrew/Cellar/postgresql@17/17.7/bin:$PATH"

# AWS CLI completion
complete -C "/opt/homebrew/bin/aws_completer" aws

# Setup TFenv: https://github.com/tfutils/tfenv
export PATH="$HOME/.tfenv/bin:$PATH"


# /home/julien/.config/shell/src/bashrc/unified/200-config.sh
# ──────────────────────────────────────────────────

#

# _________                _____.__        
# \_   ___ \  ____   _____/ ____\__| ____  
# /    \  \/ /  _ \ /    \   __\|  |/ ___\ 
# \     \___(  <_> )   |  \  |  |  / /_/  >
#  \______  /\____/|___|  /__|  |__\___  / 
#         \/            \/        /_____/  
# ----------------------------------

# Setup environment
if [[ -n "$BASH_VERSION" ]]; then
  # wildcards should match hidden files by default
  shopt -s dotglob

  # If not running interactively, don't do anything
  [[ $- != *i* ]] && return
fi

# /home/julien/.config/shell/src/bashrc/unified/300-aliases.sh
# ──────────────────────────────────────────────────

#    _____  .__  .__                             
#   /  _  \ |  | |__|____    ______ ____   ______
#  /  /_\  \|  | |  \__  \  /  ___// __ \ /  ___/
# /    |    \  |_|  |/ __ \_\___ \\  ___/ \___ \ 
# \____|__  /____/__(____  /____  >\___  >____  >
#         \/             \/     \/     \/     \/ 
# ----------------------------------

alias vi="nvim"
alias vim="nvim"
alias nano="nvim" # suck it

# should be using ripgrep (rg) if possible
alias grep='grep --color=auto' 

if command -v bat &>/dev/null; then
    alias cat="bat"
fi

less() {
  if [ -t 0 ]; then
    bat --paging=always "$@"
  else
    nvim -c "AnsiEsc" -c "setlocal buftype=nofile" -
  fi
}

# Check eza is installed
if command -v eza &>/dev/null; then
    alias ls="eza -la --git --icons --group-directories-first --time-style=long-iso --classify"
else
    echo "[WARN] Eza is not installed. Using fallback ls"
    alias ls="ls -la --color=auto"

    # using ascii to make simple tree
    # with eza you can just do `eza --tree`
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Check bfs is installed
if command -v bfs &>/dev/null; then
    alias find="bfs"
else 
    echo "[WARN] BFS is not installed. Using fallback gnu-find"
fi

# Misc funcions
alias lstoday="find . -maxdepth 1 -type f -ctime -1 -exec ls -lh {} +"
alias cdgit='cd $(git rev-parse --show-toplevel)'
alias weather="curl wttr.in/singapore"

# use git with ssh certificate without ssh-add
function gitssh() {
  GIT_SSH_COMMAND="ssh -i $1" git "${@:2}"
}

# who the heck calls it pwsh?
alias powershell="pwsh"

# alternative tools
alias dig="drill"
alias ahistory="atuin search"

# make ssh-add more secure
function ssh-add() {
  if [ -z "$SSH_AUTH_SOCK" ]; then
      eval $(ssh-agent)
  fi

  /usr/bin/ssh-add -t 600 "$@"
}

function noansi() {
  sed 's/\x1b\[[0-9;]*m//g' 
}

# alternative to tldr
function tldd() {
  # curl -s "cheat.sh/$1" | nvim -c "AnsiEsc" -c "setlocal buftype=nofile" -
  curl -s "cheat.sh/$1" | noansi | nvim -c "setlocal buftype=nofile ft=bash" -
}

# default pretty, search hidden, search files in .gitignore
alias rg="rg -p -uu"

# timestamp with format
alias timestamp='date +"%Y%m%d%H%M%S"'

# /home/julien/.config/shell/src/bashrc/macos/301-aliases.sh
# ──────────────────────────────────────────────────

# Get correct path for nvm
function nvm() {
  if [ -z $NVM_DIR ]; then 
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi

  "/opt/homebrew/opt/nvm/nvm.sh" $@
}

# Get correct path for pyenv
function pyenv() {
  if [ -z $PYENV_ROOT ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
  fi

  command "/opt/homebrew/bin/pyenv" "$@" 
}

alias tfi="tfenv install min-required && tfenv use min-required && terraform init"

# /home/julien/.config/shell/src/bashrc/unified/400-plugins.sh
# ──────────────────────────────────────────────────

# __________.__               .__               
# \______   \  |  __ __  ____ |__| ____   ______
#  |     ___/  | |  |  \/ ___\|  |/    \ /  ___/
#  |    |   |  |_|  |  / /_/  >  |   |  \\___ \ 
#  |____|   |____/____/\___  /|__|___|  /____  >
#                     /_____/         \/     \/ 
# ----------------------------------
# atuin (https://atuin.sh/)
#
# to install
# curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
#
if [[ -f "$HOME/.atuin/bin/env" ]]; then
    . "$HOME/.atuin/bin/env"
    if [[ -n "$BASH_VERSION" ]]; then
        [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
        eval "$(atuin init bash)"
        eval "$(atuin gen-completions --shell bash)"
        # returns up and down arrows to default behaviour
        bind '"\e[A": previous-history'
        bind '"\e[B": next-history'
    fi
fi

# /home/julien/.config/shell/src/bashrc/unified/401-xat.sh
# ──────────────────────────────────────────────────

xat() {
    local f delim
    for f in "$@"; do
        if [[ ! -f "$f" ]]; then
            printf 'catscript: %s: not a regular file\n' "$f" >&2
            continue
        fi

        # Pick a delimiter that doesn't appear as a line in the file
        delim=EOF
        while grep -qxF "$delim" "$f"; do
            delim="EOF_$RANDOM"
        done

        printf "cat > %s << '%s'\n" "$f" "$delim"
        cat -- "$f"
        # Add a newline only if the file doesn't already end with one,
        # so the closing delimiter lands on its own line
        [[ -n "$(tail -c1 -- "$f")" ]] && printf '\n'
        printf '%s\n\n' "$delim"
    done
}

# /home/julien/.config/shell/src/bashrc/unified/500-post-init.sh
# ──────────────────────────────────────────────────

# __________               __            .__       .__  __   
# \______   \____  _______/  |_          |__| ____ |__|/  |_ 
#  |     ___/  _ \/  ___/\   __\  ______ |  |/    \|  \   __\
#  |    |  (  <_> )___ \  |  |   /_____/ |  |   |  \  ||  |  
#  |____|   \____/____  > |__|           |__|___|  /__||__|  
#                     \/                         \/          
# ----------------------------------

# Post init custom scripts
if [[ -n "$BASH_VERSION" ]]; then
  PS1='[\u@\h \W]\$ '
fi
