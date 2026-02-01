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


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# wayland stuff
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

# set nvim as default terminal
export EDITOR=/bin/nvim
export PAGER="bat --paging=always --style=plain"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

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

#    _____  .__  .__                             
#   /  _  \ |  | |__|____    ______ ____   ______
#  /  /_\  \|  | |  \__  \  /  ___// __ \ /  ___/
# /    |    \  |_|  |/ __ \_\___ \\  ___/ \___ \ 
# \____|__  /____/__(____  /____  >\___  >____  >
#         \/             \/     \/     \/     \/ 
# ----------------------------------

alias vi="nvim"
alias vim="nvim"
alias cat="bat"
function _less() {
  if [ -t 0 ]; then
    bat --paging=always "$@"
  else
    nvim -c "AnsiEsc" -c "setlocal buftype=nofile" -
  fi
}
alias less="_less"

alias ls="eza -la --git --icons --group-directories-first --time-style=long-iso --classify"
alias find="bfs" # uses bfs find for faster searching
alias lstoday="find . -maxdepth 1 -type f -ctime -1 -exec ls -lh {} +"
alias cdgit='cd $(git rev-parse --show-toplevel)'
alias nano="nvim" # suck it
alias weather="curl wttr.in/singapore"

function gitssh() {
  GIT_SSH_COMMAND="ssh -i $1" git "${@:2}"
}

# required for paste sync

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

alias pbcopy='wl-copy'
alias pbpaste='wl-paste'

# alternative tools
alias dig="drill"
alias grep='grep --color=auto'
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
. "$HOME/.atuin/bin/env"

if [[ -n "$BASH_VERSION" ]]; then
  [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
  eval "$(atuin init bash)"
  eval "$(atuin gen-completion --shell bash)"

  # returns up and down arrows to default behaviour
  bind '"\e[A": previous-history'
  bind '"\e[B": next-history'
fi

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
