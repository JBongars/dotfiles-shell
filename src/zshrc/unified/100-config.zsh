# _________                _____.__        
# \_   ___ \  ____   _____/ ____\__| ____  
# /    \  \/ /  _ \ /    \   __\|  |/ ___\ 
# \     \___(  <_> )   |  \  |  |  / /_/  >
#  \______  /\____/|___|  /__|  |__\___  / 
#         \/            \/        /_____/  
# ----------------------------------

setopt GLOB_DOTS
[[ ! -o interactive ]] && return

bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

# start in emacs mode
bindkey -e

# Try both common ways to bind Ctrl+Q
bindkey '^H' backward-word
bindkey '^L' forward-word
bindkey '^[H' backward-kill-word  # Alt-h
bindkey '^[L' kill-word           # Alt-l

