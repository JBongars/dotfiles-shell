# __________               __            .__       .__  __   
# \______   \____  _______/  |_          |__| ____ |__|/  |_ 
#  |     ___/  _ \/  ___/\   __\  ______ |  |/    \|  \   __\
#  |    |  (  <_> )___ \  |  |   /_____/ |  |   |  \  ||  |  
#  |____|   \____/____  > |__|           |__|___|  /__||__|  
#                     \/                         \/          
# ----------------------------------

# Post init custom scripts
# PROMPT='[%F{cyan}%n%f@%F{cyan}%m%f %F{magenta}%1~%f]%# '

autoload -Uz compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit

# Enable color if terminal supports it
if [[ -x /usr/bin/tput ]] && tput setaf 1 &>/dev/null; then
    if [[ ${EUID} == 0 ]]; then
        PROMPT='%F{red}┌─[%F{red}%Broot%b%F{yellow}@%F{cyan}%m%F{red}]─[%F{green}%~%F{red}]
└──╼ %F{yellow}#%f '
    else
        PROMPT='%F{magenta}┌─%(?..[%F{white}✗%F{magenta}]─)[%f%n%F{yellow}@%F{cyan}%m%F{magenta}]─[%F{green}%~%F{magenta}]
└──╼ %F{yellow}$%f '
    fi
else
    PROMPT='┌──[%n@%m]─[%~]
└──╼ %# '
fi

# reset overrides from atuin
# use arrow keys to got up and down in history
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

bindkey "^[[3~" delete-char
