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
    echo "[WARN] BFS is not installed. Using fallback gnu-find"
    alias find="bfs"
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
