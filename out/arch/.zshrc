
#               __                                                  _..._     
#   .--.     /)/ /\                                              .-'_..._''.  
#  /.''\\._.'// /  '                       .                   .' .'      '.\ 
# (/    `---'/ /  /                      .'|                  / .'            
#           / /  /                      <  |         .-,.--. . '              
#          / /  /                        | |         |  .-. || |              
#         / /  /   .--------.        _   | | .'''-.  | |  | || |              
#        / /  /    |____    |      .' |  | |/.'''. \ | |  | |. '              
#       / /  /,.--.    /   /      .   | /|  /    | | | |  '-  \ '.          . 
#      / /  ///    \ .'   /     .'.'| |//| |     | | | |       '. `._____.-'/ 
#     /_/  / \\    //    /___ .'.'.-'  / | |     | | | |         `-.______ /  
#     \ \ /   `'--'|         |.'   \_.'  | '.    | '.|_|                  `   
#      --'         |_________|           '---'   '---'                        

# _________                _____.__        
# \_   ___ \  ____   _____/ ____\__| ____  
# /    \  \/ /  _ \ /    \   __\|  |/ ___\ 
# \     \___(  <_> )   |  \  |  |  / /_/  >
#  \______  /\____/|___|  /__|  |__\___  / 
#         \/            \/        /_____/  
# ----------------------------------

setopt GLOB_DOTS
[[ ! -o interactive ]] && return

# initialize completion system
autoload -Uz compinit && compinit

bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

[[ -f ~/.bashrc ]] && . ~/.bashrc


#   ___ ___         .__          
#  /   |   \   ____ |  | ______  
# /    ~    \_/ __ \|  | \____ \ 
# \    Y    /\  ___/|  |_|  |_> >
#  \___|_  /  \___  >____/   __/ 
#        \/       \/     |__|    
# ----------------------------------

help() {
  cat <<'EOF'
Zsh Globbing Cheatsheet
=======================

Basic
-----
*           any characters (except /)
?           single character
[abc]       a, b, or c
[a-z]       range
**/*        recursive

Qualifiers (after closing paren)
--------------------------------
*(.)        files only
*(/)        directories only
*(@)        symlinks only
*(x)        executable
*(m-7)      modified < 7 days ago
*(om)       order by modification (newest first)
*(Lk+100)   size > 100KB
*(-.)       files, follow symlinks
*(U)        owned by you

Extended (setopt EXTENDED_GLOB)
-------------------------------
^pattern    not matching pattern
x~y         x but not y
(#i)foo     case insensitive
(pat1|pat2) either pattern

Examples
--------
*.txt(.)           only .txt files
*(m0)              modified today
**/*.go(.)         all .go files recursive
*.log(Lm+10)       .log files > 10MB
*(om[1,5])         5 most recent
^*.bak             everything except .bak
EOF
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

eval "$(atuin init zsh)"
eval "$(atuin gen-completions --shell zsh)"

bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

# __________               __            .__       .__  __   
# \______   \____  _______/  |_          |__| ____ |__|/  |_ 
#  |     ___/  _ \/  ___/\   __\  ______ |  |/    \|  \   __\
#  |    |  (  <_> )___ \  |  |   /_____/ |  |   |  \  ||  |  
#  |____|   \____/____  > |__|           |__|___|  /__||__|  
#                     \/                         \/          
# ----------------------------------

# Post init custom scripts
# PS1='[\u@\h \W]\$ '
PROMPT='[%F{cyan}%n%f@%F{cyan}%m%f %F{magenta}%1~%f]%# '
