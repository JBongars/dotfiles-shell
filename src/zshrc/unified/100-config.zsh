# _________                _____.__        
# \_   ___ \  ____   _____/ ____\__| ____  
# /    \  \/ /  _ \ /    \   __\|  |/ ___\ 
# \     \___(  <_> )   |  \  |  |  / /_/  >
#  \______  /\____/|___|  /__|  |__\___  / 
#         \/            \/        /_____/  
# ----------------------------------

setopt GLOB_DOTS
[[ ! -o interactive ]] && return

bindkey "^[[3~" delete-char

# start in emacs mode
bindkey -e

# Normal defaults for moving around text
# bindkey "^[b"    backward-word      # Alt+b (back)
# bindkey "^[f"    forward-word       # Alt+f (forward)
# bindkey "^[d"    kill-word          # Alt+d (delete forward)
# bindkey "^[^h"   backward-kill-word # Alt+Backspace (or Alt+Ctrl+h)

setopt EXTENDED_HISTORY       # saves timestamp + duration per command

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
