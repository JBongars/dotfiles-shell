#

# _________                _____.__        
# \_   ___ \  ____   _____/ ____\__| ____  
# /    \  \/ /  _ \ /    \   __\|  |/ ___\ 
# \     \___(  <_> )   |  \  |  |  / /_/  >
#  \______  /\____/|___|  /__|  |__\___  / 
#         \/            \/        /_____/  
# ----------------------------------

# wildcards should match hidden files by default
shopt -s dotglob

# Setup environment
if [[ -n "$BASH_VERSION" ]]; then
  # wildcards should match hidden files by default
  shopt -s dotglob

  # If not running interactively, don't do anything
  [[ $- != *i* ]] && return
fi

